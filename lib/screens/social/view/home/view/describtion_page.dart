import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../ablelyf.dart';

class Describtion extends StatefulWidget {
  const Describtion({super.key, required this.image});

  final File? image;

  @override
  State<Describtion> createState() => _DescribtionState();
}

class _DescribtionState extends State<Describtion> {
  TextEditingController textEditingController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  var fire;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'New Post',
            style: TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.w500),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                onTap: () async {
                  print('object');
                  uploadfunc(widget.image!);
                },
                child: const Text(
                  'Upload',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.lightBlue,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: Column(
          children: [
            if (widget.image != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    //to show image, you type like this.
                    File(widget.image!.path),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                  ),
                ),
              ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: textEditingController,
              minLines: 2,
              maxLines: 5,
              cursorColor: Colors.lightBlue,
              style: const TextStyle(
                  color: Colors.white, fontStyle: FontStyle.normal),
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                ),
                hintText: 'description',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ],
        ));
  }

  uploadfunc(File image) async {
    List<int> imagebytes = image.readAsBytesSync();
    print('IMAGEBYTES: $imagebytes');
    if (imagebytes.isNotEmpty) {
      String base64 = base64Encode(imagebytes);
      Dio dio = Dio();
      dio.options.baseUrl =
          'https://e0h5bbs247.execute-api.eu-north-1.amazonaws.com/stg/postupload';
      dio.post(
        '/',
        data: {
          'caption': textEditingController.text,
          'type': 1,
          'userId': constants.myId,
          'image': base64
        },
      );
      var fire =
          await firebaseFirestore.collection('users').doc(constants.myId).get();
      firebaseFirestore.collection('notification').add({
        'content': '${fire.data()?['name']} has Upload a Photo ',
        'time': DateTime.now().millisecondsSinceEpoch,
        'profileImage': fire.data()?['profileImage']
      });

      Get.to(const BottomPageSocial());

      // int time = DateTime.now().millisecondsSinceEpoch;

      // firebaseFirestore
      //     .collection("users")
      //     .doc(constants.myId)
      //     .collection("posts")
      //     .doc(time.toString())
      //     .set({
      //   'userId': constants.myId,
      //   'id': time,
      //   'media': base64,
      //   'time': time,
      //   'caption': textEditingController.text,
      //   'type': MessageType.image.index,
      // });
    }
  }
}
