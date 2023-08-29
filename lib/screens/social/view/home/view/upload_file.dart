import 'dart:io';

import 'package:newp/screens/social/view/home/view/describtion_page.dart';

import '../../../../../ablelyf.dart';

class UploadPost extends StatefulWidget {
  const UploadPost({super.key});

  @override
  State<UploadPost> createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  @override
  void initState() {
    // getImage(ImageSource.gallery);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
          color: Colors.white,
        ),
        height: 0.30.sh,
        width: 1.sw,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*  const Text(
                'Please Select One',
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ), */
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  //if user click this button, user can upload image from gallery
                  onPressed: () async {
                    // Navigator.pop(context);
                    await getImage(ImageSource.gallery);

                    Get.to(Describtion(image: File(image?.path ?? '')));
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsetsDirectional.all(5.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.3)),
                        child: const Icon(
                          Icons.image,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        'From Gallery',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  //if user click this button. user can upload image from camera
                  onPressed: () async {
                    // Navigator.pop(context);
                    await getImage(ImageSource.camera);

                    Get.to(Describtion(image: File(image?.path ?? '')));
                  },
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsetsDirectional.all(5.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.3)),
                          child: const Icon(
                            Icons.camera,
                            color: Colors.black,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        'From Camera',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  //if user click this button, user can upload image from gallery
                  onPressed: () async {
                    // Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsetsDirectional.all(5.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.3)),
                        child: Icon(
                          Icons.videocam,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        'From Video',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
