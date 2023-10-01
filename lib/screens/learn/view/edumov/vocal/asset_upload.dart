import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:newp/ablelyf.dart';

class AssetUploadScreen extends StatefulWidget {
  const AssetUploadScreen({super.key});

  @override
  _AssetUploadScreenState createState() => _AssetUploadScreenState();
}

class _AssetUploadScreenState extends State<AssetUploadScreen> {
  File? _image;
  final picker = ImagePicker();

  bool loading = false;
  TextEditingController _imageNameController = TextEditingController();
  TextEditingController _imageOption1Controller = TextEditingController();
  TextEditingController _imageOption2Controller = TextEditingController();
  TextEditingController _imageOption3Controller = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void dispose() {
    _imageNameController.dispose();
    _imageOption1Controller.dispose();
    _imageOption2Controller.dispose();
    _imageOption3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset Upload'),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        getImage();
                      },
                      child: const Text('Select Image'),
                    ),
                    const SizedBox(height: 20),
                    if (_image != null)
                      Image.file(
                        _image!,
                        height: 200,
                      ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _imageNameController,
                      decoration: const InputDecoration(
                        labelText: 'Image Name',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _imageOption1Controller,
                      decoration: const InputDecoration(
                        labelText: 'Option 1',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _imageOption2Controller,
                      decoration: const InputDecoration(
                        labelText: 'Option 2',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _imageOption3Controller,
                      decoration: const InputDecoration(
                        labelText: 'Option 3',
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        String imageName = _imageNameController.text;
                        String option1 = _imageOption1Controller.text;
                        String option2 = _imageOption2Controller.text;
                        String option3 = _imageOption3Controller.text;

                        if (imageName.replaceAll(' ', '').isNotEmpty &&
                            option1.replaceAll(' ', '').isNotEmpty &&
                            option2.replaceAll(' ', '').isNotEmpty &&
                            option3.replaceAll(' ', '').isNotEmpty &&
                            _image != null) {
                          setState(() {
                            loading = true;
                          });

                          Uint8List imageList = await _image!.readAsBytes();

                          String base64 = base64Encode(imageList);

                          Dio dio = Dio();

                          dio.options.baseUrl =
                              'https://20f59p2e5c.execute-api.eu-north-1.amazonaws.com/Stg/';

                          await dio.post('asset_upload', data: {
                            "image": base64,
                            "name": imageName,
                            "options": [option1, option2, option3]
                          });
                        }

                        Get.back();

                        print('Image Name: $imageName');
                        print('Option 1: $option1');
                        print('Option 2: $option2');
                        print('Option 3: $option3');
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
