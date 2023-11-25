import 'package:newp/ablelyf.dart';

class SeeCameraPage extends StatefulWidget {
  const SeeCameraPage({super.key});

  @override
  State<SeeCameraPage> createState() => _SeeCameraPageState();
}

class _SeeCameraPageState extends State<SeeCameraPage> {
  ObjectController objectController = Get.put(ObjectController());

  @override
  void initState() {
    // controller = GifController(loop: false, autoPlay: false);
    objectController.loadCamera().then((value) {
      objectController.startImageStream();
    });

    super.initState();
  }

  @override
  void dispose() {
    objectController.cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          objectController.switchCamera();
        },
        child: const Icon(Icons.switch_camera_outlined),
      ),
      body: GetBuilder<ObjectController>(
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              objectController.cameraController != null &&
                      objectController.cameraController!.value.isInitialized
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: SafeArea(
                        child: SizedBox(
                          height: 0.9.sh,
                          // width: 1.sw,
                          child: Transform.scale(
                            scale: 1,
                            child: CameraPreview(
                              objectController.cameraController!,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
              Expanded(
                child: Center(
                  child: Text(objectController.faceAtMoment.isNotEmpty
                      ? "${objectController.faceAtMoment} is Ahead"
                      : ""),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
