import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:newp/ablelyf.dart';
import 'package:newp/screens/express/view/nextpage.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  IrisController irisController = Get.put(IrisController());

  List<GlobalKey> keys = List.generate(4, (index) => GlobalKey());

  static const EventChannel stream = EventChannel('LandmarkListener');

  Map? location;
  Map? left;
  Map? right;
  Map? top;
  Map? bottom;
  Map? eye;

  double leftPos = 0;
  double topPos = 0;
  bool click = false;
  StreamSubscription? _timerSubscription;
  void _enableTimer() {
    _timerSubscription ??= stream.receiveBroadcastStream().listen(_updateTimer);
  }

  void _updateTimer(timer) {
    // Map<String, dynamic> data = jsonDecode(timer);
    setState(() {
      print('Result DATA: ${timer}');
      location = jsonDecode(timer);
      if (location != null) {
        left = location?["left"];
        right = location?["right"];
        top = location?["top"];
        bottom = location?["bottom"];
        eye = location?["eye"];
        leftPos = location?["leftPercentage"];
        topPos = location?["topPercentage"];

        click = location?["click"];

        if (click) {
          int index = keys.indexWhere((element) {
            RenderBox? box1 =
                element.currentContext?.findRenderObject() as RenderBox?;
            print('SssssPOSITION: ${box1}');

            if (box1 != null) {
              Offset position = box1.localToGlobal(Offset.zero);
              print(
                  'SssssPOSITION: ${position}         ${1.sw - eye!['y'].toDouble() * 1.sw}           ${1.sh - eye!['x'].toDouble() * 1.sh}');

              double xPosition = 1.sw - eye!['y'].toDouble() * 1.sw;
              double yPosition = 1.sh - eye!['x'].toDouble() * 1.sh;

              double width = box1.size.width;
              print('SssssPOSITION WIDTH: ${width}');
              double height = box1.size.height;

              double boxLeft = position.dx;
              double boxRight = position.dx + width;

              double boxTop = position.dy;
              double boxBottom = position.dy + height;

              return yPosition <= boxBottom &&
                  yPosition >= boxTop &&
                  xPosition <= boxRight &&
                  xPosition >= boxLeft;
            }

            return false;
          });

          if (index != -1) {
            String title = "";

            switch (index) {
              case 0:
                title = "Communication";
                break;
              case 1:
                title = "Entertainment";
                break;
              case 2:
                title = "Entertainment";
                break;
              case 3:
                title = "Alert";
                break;
              default:
            }
            Get.to(
              () => NextPage(
                title: title,
              ),
            );
          }

          // tap(
          //   Offset(
          //     eye!['x'].toDouble() * 1.sw,
          //     eye!['y'].toDouble() * 1.sh,
          //   ),
          // );
        }
      }
      // print('Result DATA: ${location!['sublist'].length}');
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
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
                  /* Row(
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
                  const SizedBox(height: 30), */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        key: keys[0],
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
                        key: keys[1],
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
                        key: keys[2],
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
                        key: keys[3],
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
                  /*  Row(
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
                  */
                  const SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      // Get.to(() => const Page2());

                      tap(Offset(247.1, 606.0));
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
                              width: 0.35.sw,
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
              if (eye != null)
                Positioned(
                  right: eye!['y'].toDouble() * 1.sw,
                  bottom: eye!['x'].toDouble() * 1.sh,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),

              if (click)
                Positioned(
                  right: 0.5.sw,
                  bottom: 0.9.sh,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              /*  if (left != null)
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
              /*  Positioned(
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

               Positioned(
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

void tap(Offset pos) {
  print('POSCLick: ${pos}');
  // final result = HitTestResult();
  // WidgetsBinding.instance.hitTest(result, pos);

  GestureBinding.instance.handlePointerEvent(
    PointerDownEvent(position: pos),
  );
  // final result = HitTestResult();
  // WidgetsBinding.instance.hitTest(result, pos);
  // // print('RESULT: ${result}');
  // result.path.forEach((element) {
  //   element.target.handleEvent(
  //     PointerDownEvent(position: pos, kind: PointerDeviceKind.touch),
  //     element,
  //   );
  //   element.target.handleEvent(
  //     PointerUpEvent(position: pos, kind: PointerDeviceKind.touch),
  //     element,
  //   );
  // });
}
