import 'dart:async';

import 'package:newp/ablelyf.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  IrisController irisController = Get.put(IrisController());

  static const EventChannel stream = EventChannel('LandmarkListener');

  Map? location;
  Map? left;
  Map? right;
  Map? top;
  Map? bottom;
  Map? eye;

  double leftPos = 0;
  double topPos = 0;
  StreamSubscription? _timerSubscription;
  void _enableTimer() {
    _timerSubscription ??= stream.receiveBroadcastStream().listen(_updateTimer);
  }

  void _updateTimer(timer) {
    // Map<String, dynamic> data = jsonDecode(timer);
    setState(() {
      // print('Result DATA: ${timer}');
      location = jsonDecode(timer);
      if (location != null) {
        left = location?["left"];
        right = location?["right"];
        top = location?["top"];
        bottom = location?["bottom"];
        eye = location?["eye"];
        leftPos = location?["leftPercentage"];
        topPos = location?["topPercentage"];
        print('Response TOPPOS: ${topPos}');
        print('Response LEFTPOS: ${leftPos}');
      }
      // print('Result DATA: ${location!['sublist'].length}');
    });
  }

  @override
  void initState() {
    irisController.loadCamera().then((value) async {
      await irisController.channel.invokeMethod("start");
      await irisController.startImageStream();
      _enableTimer();
    });

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    // ]);
    super.initState();
  }

  @override
  void dispose() {
    irisController.cameraController?.dispose();

    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<IrisController>(
        builder: (_) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 0.1.sh,
                        width: 0.28.sw,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(240, 105, 105, 105),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              PageNew.camera,
                              width: 0.06.sw,
                            ),
                            const Text(
                              'Live Feed',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 0.1.sh,
                        width: 0.28.sw,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(240, 105, 105, 105),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              PageNew.selectIcon,
                              width: 0.06.sw,
                            ),
                            const Text(
                              'Calibrate \nEye Tracker',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 0.1.sh,
                        width: 0.28.sw,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(240, 105, 105, 105),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              PageNew.workflow,
                              width: 0.06.sw,
                            ),
                            const Text(
                              'Start \nInteraction',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 0.2.sh,
                        width: 0.22.sw,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(240, 105, 105, 105),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              PageNew.grouptask,
                              width: 0.08.sw,
                            ),
                            const Text(
                              'Communication',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 0.2.sh,
                        width: 0.22.sw,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(240, 105, 105, 105),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              PageNew.retrotv,
                              width: 0.08.sw,
                            ),
                            const Text(
                              'Entertainment',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 0.2.sh,
                        width: 0.22.sw,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(240, 105, 105, 105),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              PageNew.bookreading,
                              width: 0.08.sw,
                            ),
                            const Text(
                              'Entertainment',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 0.2.sh,
                        width: 0.20.sw,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(240, 105, 105, 105),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              PageNew.siren,
                              width: 0.08.sw,
                            ),
                            const Text(
                              'Alert',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.1.sh),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'User name',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 0.25.sw,
                            height: 0.08.sw,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 0.25.sw,
                            height: 0.08.sw,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: const Center(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Disability Type',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              // Get.to(() {
                              //   return const Page2();
                              // });
                            },
                            child: Container(
                              width: 0.25.sw,
                              height: 0.08.sw,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Center(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      Get.to(() => const Page2());
                    },
                    child: Container(
                      height: 0.06.sh,
                      width: 0.15.sw,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(240, 105, 105, 105),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          'DONE',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  irisController.cameraController != null &&
                          irisController.cameraController!.value.isInitialized
                      ? Align(
                          alignment: Alignment.topCenter,
                          child: SafeArea(
                            child: SizedBox(
                              height: 0.3.sh,
                              width: 0.3.sw,
                              child: Transform.scale(
                                scale: 1,
                                child: CameraPreview(
                                  irisController.cameraController!,
                                ),
                              ),
                            ),
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ],
              ),
              // for (int i = 0; i < irisController.points.length; i++)
              /*  if (eye != null)
                Positioned(
                  right: eye!['y'].toDouble() * 1.sw,
                  bottom: eye!['x'].toDouble() * 1.sh,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              if (left != null)
                Positioned(
                  right: left!['y'].toDouble() * 1.sw,
                  bottom: left!['x'].toDouble() * 1.sh,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              if (right != null)
                Positioned(
                  right: right!['y'].toDouble() * 1.sw,
                  bottom: right!['x'].toDouble() * 1.sh,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              if (top != null)
                Positioned(
                  right: top!['y'].toDouble() * 1.sw,
                  bottom: top!['x'].toDouble() * 1.sh,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              if (bottom != null)
                Positioned(
                  right: bottom!['y'].toDouble() * 1.sw,
                  bottom: bottom!['x'].toDouble() * 1.sh,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
 */
              // if (location != null)
              // for (int i = 0; i < location!['sublist'].length; i++)
              Positioned(
                left: (leftPos / 100) * 1.sw,
                top: (topPos / 100) * 1.sh,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),

              /* Positioned(
              right: irisController.faceAtMoment.x.toDouble(),
              top: irisController.faceAtMoment.y.toDouble(),
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ), */
            ],
          );
        },
      ),
    );
  }
}
