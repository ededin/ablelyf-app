import 'package:newp/ablelyf.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  IrisController irisController = Get.put(IrisController());

  @override
  void initState() {
    irisController.loadCamera().then((value) {
      irisController.startImageStream();
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Icon(Icons.settings),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 10),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 0.12.sh,
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
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 0.12.sh,
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
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 0.12.sh,
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
                          style: TextStyle(fontSize: 12, color: Colors.white),
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
                          style: TextStyle(fontSize: 10, color: Colors.white),
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
                          style: TextStyle(fontSize: 10, color: Colors.white),
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
                          style: TextStyle(fontSize: 10, color: Colors.white),
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
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            left: irisController.faceAtMoment.x.toDouble(),
            top: irisController.faceAtMoment.y.toDouble(),
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}