import 'dart:io';

import 'package:newp/screens/social/controller/message_controller.dart';

import '../../../../ablelyf.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, this.name, this.email});
  final String? name;
  final String? email;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();
  MessageController messageController = Get.put(MessageController());
  FocusNode emailFocus = FocusNode();
  int limit = 0;
  var d12;
  XFile? image;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.more_horiz,
            weight: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: SizedBox(
                height: 46,
                width: 0.80.sw,
                child: TextField(
                  controller: textEditingController,
                  style: const TextStyle(fontSize: 17, color: Colors.black),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Spacer(),
                            InkWell(
                              onTap: () async {
                                await getImage(ImageSource.camera);
                                Future.delayed(const Duration(seconds: 1), () {
                                  Get.to(ImagePreview(
                                      image: File(image?.path ?? '')));
                                });
                              },
                              child: Icon(Icons.camera_enhance,
                                  color: Theme.of(context).iconTheme.color),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                if (textEditingController.text.isNotEmpty) {
                                  int time =
                                      DateTime.now().millisecondsSinceEpoch;

                                  firebaseFirestore
                                      .collection("chat")
                                      .doc(getChatId(
                                          "MQtCWxSzxkgHwm5lJknkR3JZqtH3"))
                                      .collection("messages")
                                      .doc(time.toString())
                                      .set({
                                    'senderid': constants.myId,
                                    'chatid': 'MQtCWxSzxkgHwm5lJknkR3JZqtH3',
                                    'time': time,
                                    'content': textEditingController.text,
                                    'type': MessageType.text.index,
                                  });
                                  textEditingController.clear();
                                } else {
                                  Get.snackbar(
                                      'Ablelyf', 'Please Type Something',
                                      messageText: const Text(
                                        'Please Type Something',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.red,
                                      snackPosition: SnackPosition.BOTTOM,
                                      snackStyle: SnackStyle.FLOATING);
                                }
                              },
                              child: Icon(Icons.send,
                                  color: Theme.of(context).iconTheme.color),
                            ),
                          ],
                        ),
                      ),
                      // prefixIcon: Icon(Icons.search,
                      //     color: Theme.of(context).iconTheme.color),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      contentPadding: const EdgeInsets.all(10.0),
                      hintText: '    Type your message here.',
                      hintStyle:
                          const TextStyle(color: Colors.black, fontSize: 17)),
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          children: [
            Text(
              widget.name.toString(),
              style: TextStyle(color: Colors.white),
            ),
            Text(
              widget.email.toString(),
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
        actions: [
          const Icon(Icons.call),
          const SizedBox(
            width: 10,
          ),
          InkWell(onTap: () {}, child: const Icon(Icons.video_call)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: firebaseFirestore
                .collection("chat")
                .doc(getChatId("MQtCWxSzxkgHwm5lJknkR3JZqtH3"))
                .collection("messages")
                .orderBy('time', descending: true)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return (snapshot.data?.docs ?? []).isNotEmpty
                    ? Expanded(
                        child: SizedBox(
                          // width: 200,
                          child: ListView.builder(
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            reverse: true,
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              var data = snapshot.data?.docs[index].data();
                              // var timestamp = data?['time'];
                              // var time = DateTime.fromMillisecondsSinceEpoch(timestamp);
                              // d12 = DateFormat('hh:mm a').format(time);
                              return constants.myId ==
                                      'MQtCWxSzxkgHwm5lJknkR3JZqtH3'
                                  ? Align(
                                      alignment: Alignment.centerLeft,
                                      child: Card(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(25.0),
                                                bottomLeft:
                                                    Radius.circular(25.0),
                                                bottomRight:
                                                    Radius.circular(25.0)),
                                          ),
                                          child: Container(
                                            // width: 200,
                                            padding: const EdgeInsets.all(15.0),
                                            decoration: BoxDecoration(
                                                borderRadius: const BorderRadius
                                                        .only(
                                                    topRight:
                                                        Radius.circular(25.0),
                                                    bottomLeft:
                                                        Radius.circular(25.0),
                                                    bottomRight:
                                                        Radius.circular(25.0)),
                                                border: Border.all(
                                                    color: Colors.black45)),
                                            child: Text(
                                              data?['content'],
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal),
                                            ),
                                          )),
                                    )
                                  : Align(
                                      alignment: Alignment.centerRight,
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: data?['type'] == 1
                                                    ? const Radius.circular(
                                                        25.0)
                                                    : const Radius.circular(0),
                                                topRight:
                                                    const Radius.circular(25.0),
                                                bottomLeft:
                                                    const Radius.circular(25.0),
                                                bottomRight:
                                                    const Radius.circular(
                                                        25.0)),
                                          ),
                                          child: Container(
                                            // width: 200,
                                            padding: const EdgeInsets.all(15.0),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: data?['type'] == 1
                                                        ? const Radius.circular(
                                                            25.0)
                                                        : const Radius.circular(
                                                            0),
                                                    topRight:
                                                        const Radius.circular(
                                                            25.0),
                                                    bottomLeft:
                                                        const Radius.circular(
                                                            25.0),
                                                    bottomRight:
                                                        const Radius.circular(
                                                            25.0)),
                                                border: Border.all(
                                                    color: data?['type'] == 1
                                                        ? Colors.transparent
                                                        : Colors.black45)),
                                            child: data?['type'] == 1
                                                ? Container(
                                                    height: 0.30.sh,
                                                    width: 0.40.sw,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                data?['media']),
                                                            fit: BoxFit.cover)),
                                                  )
                                                : Text(
                                                    data?['content'],
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal),
                                                  ),
                                          )),
                                    );
                            },
                          ),
                        ),
                      )
                    : const Center(
                        child: Text(
                        'No messages Found',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                      ));
              }
            },
          ),
          // const Spacer(),
        ],
      ),
    );
  }

  // void sendChatMessage(
  //     String content, int type, String currentUserId, String peerId) {
  //   DocumentReference documentReference = firebaseFirestore
  //       .collection('Chat')
  //       .doc('CRyUxM8Et1YseGeiwo5GU53DVhJ2')
  //       .collection('messages')
  //       .doc(DateTime.now().millisecondsSinceEpoch.toString());
  //   ChatMessage chatMessages = ChatMessage(
  //       id: currentUserId,
  //       senderId: peerId,
  //       time: DateTime.now().millisecondsSinceEpoch.toString(),
  //       type: type);

  //   FirebaseFirestore.instance.runTransaction((transaction) async {
  //     transaction.set(documentReference, chatMessages.toJson());
  //   });
  // }
  // // void onSendMessage(String content, int type) {
  //   // type: 0 = text, 1 = image, 2 = sticker
  //   if (content.trim() != '') {
  //     textEditingController.clear();

  //     var documentReference =FirebaseFirestore.instance
  //         .collection('messages')
  //         .doc('')
  //         .collection(groupChatId)
  //         .doc(DateTime.now().millisecondsSinceEpoch.toString());

  //     FirebaseFirestore.instance.runTransaction((transaction) async {
  //       await transaction.set(
  //         documentReference,
  //         {
  //           'idFrom': id,
  //           'idTo': peerId,
  //           'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
  //           'content': content,
  //           'type': type
  //         },
  //       );
  //     });
  //     scrollController.animateTo(0.0,
  //         duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  //   } else {
  //           Get.snackbar('Ablelyf', 'Nothing to found');

  //   }
  // }

  // void onSendMessage(String content, int type) {
  //   if (content.trim().isNotEmpty) {
  //     textEditingController.clear();

  //     sendChatMessage(content, type, 'CRyUxM8Et1YseGeiwo5GU53DVhJ2',
  //         'MQtCWxSzxkgHwm5lJknkR3JZqtH3');
  //     scrollController.animateTo(0,
  //         duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  //   } else {
  //     Get.snackbar('Ablelyf', 'Nothing to found');
  //   }
  // }

//   Stream<QuerySnapshot> getChatMessage(String groupChatId, int limit) {
//     return firebaseFirestore
//         .collection('Chat')
//         .doc('CRyUxM8Et1YseGeiwo5GU53DVhJ2')
//         .collection('messages')
//         .orderBy('', descending: true)
//         .limit(limit)
//         .snapshots();
//   }
// }
  // Padding(
  //   padding: const EdgeInsets.only(left: 18.0),
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Container(
  //         height: 0.40.sh,
  //         width: 0.50.sw,
  //         decoration: const BoxDecoration(
  //             image: DecorationImage(
  //                 image: NetworkImage(
  //                     'https://media.istockphoto.com/id/529363157/photo/happy-family-sitting-on-park-bench.jpg?s=612x612&w=0&k=20&c=gyd4TUyTF5OVwj1FkKHXmh3ASab9-68GQocPwy_Ey7M='),
  //                 fit: BoxFit.cover),
  //             borderRadius: BorderRadius.all(Radius.circular(25.0))),
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       Container(
  //         padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(25.0),
  //             border: Border.all(color: Colors.black45)),
  //         child: const Text(
  //             'I had an Amazing experience here.\nyou should defenitely try it!'),
  //       ),
  //       const SizedBox(
  //         height: 10.0,
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(left: 230),
  //         child: Column(
  //           children: [
  //             Container(
  //               padding: const EdgeInsets.symmetric(
  //                   horizontal: 18, vertical: 15),
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(25.0),
  //                   border: Border.all(color: Colors.black45)),
  //               child: const Text('Sure, Lets plan it.'),
  //             ),
  //             const SizedBox(
  //               height: 10.0,
  //             ),
  //             Container(
  //               padding: const EdgeInsets.symmetric(
  //                   horizontal: 18, vertical: 15),
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(25.0),
  //                   border: Border.all(color: Colors.black45)),
  //               child: const Text('great time with u.'),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Container(
  //         padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(25.0),
  //             border: Border.all(color: Colors.black45)),
  //         child: const Text('Great..11.05'),
  //       ),
  //     const Spacer(),
  //     Row(
  //       children: [
  //         const SizedBox(
  //           width: 20,
  //         ),
  //         const Icon(
  //           Icons.more_horiz,
  //           weight: 30,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 5),
  //           child: Card(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(30.0)),
  //             child: SizedBox(
  //               height: 46,
  //               width: 0.80.sw,
  //               child: TextField(
  //                 controller: textEditingController,
  //                 maxLines: 1,
  //                 style: const TextStyle(fontSize: 17),
  //                 textAlignVertical: TextAlignVertical.center,
  //                 decoration: InputDecoration(
  //                     filled: true,
  //                     suffixIcon: Icon(Icons.mic,
  //                         color: Theme.of(context).iconTheme.color),
  //                     // prefixIcon: Icon(Icons.search,
  //                     //     color: Theme.of(context).iconTheme.color),
  //                     border: const OutlineInputBorder(
  //                         borderSide: BorderSide.none,
  //                         borderRadius:
  //                             BorderRadius.all(Radius.circular(30))),
  //                     fillColor: Theme.of(context)
  //                         .inputDecorationTheme
  //                         .fillColor,
  //                     contentPadding: EdgeInsets.zero,
  //                     hintText: '    Type your message here.',
  //                     hintStyle: const TextStyle(
  //                         color: Colors.grey, fontSize: 17)),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   ],
  // ),
  // ),
}

String getChatId(String id) {
  List users = [
    constants.myId,
    id,
  ];

  users.sort();

  return users.join('-');
}
