import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../ablelyf.dart';

class ImagePreview extends StatefulWidget {
  const ImagePreview({super.key, this.image});
  final File? image;

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  TextEditingController imagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
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
                    height: 0.90.sh,
                  ),
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                cursorColor: Colors.lightBlue,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {
                      uploadfunc(widget.image!);
                    },
                    child: const Icon(
                      Icons.send,
                      size: 25,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.emoji_emotions,
                    color: Colors.amber,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlue),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  border: InputBorder.none,
                  hintText: "Caption",
                  hintStyle: const TextStyle(color: Colors.grey),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  isDense: true,
                ),
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  uploadfunc(File image) async {
    List<int> imagebytes = image.readAsBytesSync();
    print('IMAGEBYTES: ${imagebytes}');
    if (imagebytes.isNotEmpty) {
      String base64 = base64Encode(imagebytes);
      Dio dio = Dio();
      dio.options.baseUrl =
          'https://e0h5bbs247.execute-api.eu-north-1.amazonaws.com/stg/chatupload';
      dio.post(
        '/',
        data: {
          'chatId': getChatId('MQtCWxSzxkgHwm5lJknkR3JZqtH3'),
          'type': 1,
          'userId': constants.myId,
          'image': base64
        },
      );
      Get.offAll(const ChatPage());
    }
  }
}
