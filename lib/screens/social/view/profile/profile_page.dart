import 'dart:io';
import '../../../../ablelyf.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  XFile? image;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    Future.delayed(const Duration(seconds: 1), () {
      Get.to(ProfileImagePreview(image: File(image?.path ?? '')));
    });

    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile"),
      ),
      body: FutureBuilder(
        future: firebaseFirestore.collection('users').doc(constants.myId).get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          var dataa = snapshot.data?.data();
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return FutureBuilder(
              future: firebaseFirestore
                  .collection('users')
                  .doc(constants.myId)
                  .collection('posts')
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                      sathishshot) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ListView(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(dataa?[
                                  'profileImage'] ??
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                        ),
                        title: Text(dataa?['name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        subtitle: const Text(
                          'Software Engineer',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black45,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                (sathishshot.data?.docs ?? [])
                                    .length
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const Text(
                                'Posts',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          // const Column(
                          //   children: [
                          //     Text(
                          //       '50',
                          //       style: TextStyle(
                          //           color: Colors.black,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 18),
                          //     ),
                          //     Text(
                          //       'Followers',
                          //       style: TextStyle(
                          //           color: Colors.black54,
                          //           fontWeight: FontWeight.normal,
                          //           fontSize: 18),
                          //     ),
                          //   ],
                          // ),
                          //    const Column(
                          //     children: [
                          //       Text(
                          //         '100',
                          //         style: TextStyle(
                          //             color: Colors.black,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 18),
                          //       ),
                          //       Text(
                          //         'Following',
                          //         style: TextStyle(
                          //             color: Colors.black54,
                          //             fontWeight: FontWeight.normal,
                          //             fontSize: 18),
                          //       ),
                          //     ],
                          //   )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Container(
                      //         alignment: Alignment.center,
                      //         width: 0.44.sw,
                      //         height: 50,
                      //         padding: const EdgeInsets.all(8),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(30.0),
                      //           color: Colors.black,
                      //         ),
                      //         child: const Text(
                      //           'Chat',
                      //           style: TextStyle(
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 16),
                      //         )),
                      //     Container(
                      //         alignment: Alignment.center,
                      //         width: 0.44.sw,
                      //         height: 50,
                      //         padding: const EdgeInsets.all(8),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(30.0),
                      //           color: Colors.black,
                      //         ),
                      //         child: const Text(
                      //           'Follow',
                      //           style: TextStyle(
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 16),
                      //         )),
                      //   ],
                      // ),
                      const ListTile(
                        leading: Text(
                          'Photos',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                        ),
                      ),
                      Builder(
                        builder: (
                          BuildContext context,
                        ) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return (sathishshot.data?.docs ?? []).isNotEmpty
                                ? Align(
                                    child: SizedBox(
                                      height: 0.20.sh,
                                      child: ListView.builder(
                                        itemCount: (sathishshot.data?.docs
                                                    .where((element) =>
                                                        element
                                                            .data()['type'] ==
                                                        1) ??
                                                [])
                                            .length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var data = sathishshot.data?.docs
                                              .where((element) =>
                                                  element.data()['type'] == 1)
                                              .toList()[index]
                                              .data();
                                          return Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                            child: Container(
                                              height: 0.20.sh,
                                              width: 0.40.sw,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          data?['media']),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                : const Center(
                                    child: Text(
                                    'No Posts Found',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic),
                                  ));
                          }
                        },
                      )
                      // const SizedBox(
                      //   height: 15,
                      // );
                      //     const ListTile(
                      //       leading: Text(
                      //         'Videos',
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontWeight: FontWeight.w500,
                      //             fontSize: 18),
                      //       ),
                      //       trailing: Icon(
                      //         Icons.keyboard_arrow_right,
                      //         color: Colors.grey,
                      //       ),
                      //     ),
                      //     Align(
                      //       child: SizedBox(
                      //         height: 0.30.sh,
                      //         child: ListView.builder(
                      //           itemCount: 3,
                      //           scrollDirection: Axis.horizontal,
                      //           itemBuilder: (BuildContext context, int index) {
                      //             return Card(
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius: BorderRadius.circular(15.0)),
                      //               child: Container(
                      //                 height: 0.30.sh,
                      //                 width: 0.40.sw,
                      //                 decoration: BoxDecoration(
                      //                     image: DecorationImage(
                      //                         image: NetworkImage(video[index]),
                      //                         fit: BoxFit.cover),
                      //                     borderRadius: BorderRadius.circular(15.0)),
                      //               ),
                      //             );
                      //           },
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // );
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  profileBottom(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: 400,
            height: 0.2.sh,
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Select',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      await getImage(ImageSource.gallery);
                      Get.back();
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
                  child: InkWell(
                    onTap: () {
                      getImage(ImageSource.camera);
                      Get.back();
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
              ],
            ),
          );
        });
  }
}
