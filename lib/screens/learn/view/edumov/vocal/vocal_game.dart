import 'package:lottie/lottie.dart';

import '../../../../../ablelyf.dart';

class VocalGame extends StatefulWidget {
  const VocalGame({super.key});

  @override
  State<VocalGame> createState() => _VocalGameState();
}

class _VocalGameState extends State<VocalGame> with TickerProviderStateMixin {
  bool speechAvailable = false;
  SpeechToText speech = SpeechToText();
  VocalController vocalController = Get.put(VocalController());
  TabController? controller;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      speech.initialize(
        onStatus: (status) {
          print('SPEECH STATUS: $status');
        },
        onError: (errorNotification) {
          print('SPEECH ERRORNOTIFICATION: ${errorNotification.errorMsg}');

          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(errorNotification.errorMsg)));
        },
      ).then((value) {
        if (value) {
          setState(() {
            speechAvailable = true;
          });

          startListen();
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
      future: FirebaseFirestore.instance.collection('vocalAssets').get(),
      builder: (context, snapshot) {
        if (snapshot.data!.size > 0) {
          controller = TabController(length: snapshot.data!.size, vsync: this);
          controller?.addListener(() {
            startListen();
          });
        }

        return GetBuilder<VocalController>(
          builder: (_) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  startListen();
                },
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.record_voice_over),
                      Text(
                        "Speak",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              appBar: AppBar(
                title: const Text("Visual Story Emotional Regulation"),
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.to(() => const AssetUploadScreen())?.then((value) {
                        setState(() {});
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              body: Column(
                children: [
                  Text(vocalController.result ?? ""),
                  Expanded(
                    child: TabBarView(
                      controller: controller,
                      children: [
                        for (int i = 0; i < snapshot.data!.size; i++)
                          Builder(
                            builder: (context) {
                              Map<String, dynamic> data =
                                  snapshot.data!.docs[i].data();

                              bool? answer;
                              if (vocalController.result != null) {
                                print(
                                    '(DATA ${(data['name']).toLowerCase()} ${vocalController.result}');
                                if (data['name'].toLowerCase() ==
                                        vocalController.result &&
                                    controller!.index < controller!.length &&
                                    vocalController.result!.isNotEmpty) {
                                  answer = true;
                                } else if (vocalController.result!.isNotEmpty) {
                                  answer = false;
                                }

                                Future.delayed(
                                  const Duration(milliseconds: 300),
                                  () {
                                    vocalController.updateResult(null);

                                    Get.dialog(
                                      Center(
                                        child: Lottie.asset(
                                          answer!
                                              ? LottieAssets.correct
                                              : LottieAssets.wrong,
                                          onLoaded: (p0) {
                                            print('P0: ${p0.duration}');
                                          },
                                          repeat: false,
                                        ),
                                      ),
                                    );
                                    Future.delayed(
                                      const Duration(seconds: 3),
                                      () {
                                        Get.close(1);
                                        if (answer!) {
                                          controller?.animateTo(
                                              controller!.index + 1);
                                        }
                                      },
                                    );
                                  },
                                );
                              }

                              return Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        onPressed: () async {
                                          await FirebaseFirestore.instance
                                              .collection("vocalAssets")
                                              .doc(data['id'].toString())
                                              .delete();

                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.delete),
                                      ),
                                    ),
                                    ConstrainedBox(
                                      constraints:
                                          BoxConstraints(maxHeight: 0.6.sh),
                                      child: CachedNetworkImage(
                                          imageUrl: data['image']),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        for (String option in data['options'])
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: constants.themeColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              option,
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void startListen() {
    if (speechAvailable) {
      speech.listen(
          onResult: (result) {
            print('SPEECH Result: ${result.recognizedWords}');

            vocalController.updateResult(result.recognizedWords);
          },
          listenMode: ListenMode.dictation);
    }
  }
}
