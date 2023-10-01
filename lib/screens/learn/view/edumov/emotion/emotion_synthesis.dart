import 'package:newp/ablelyf.dart';

class EmotionSynthesisPage extends StatefulWidget {
  const EmotionSynthesisPage({super.key});

  @override
  State<EmotionSynthesisPage> createState() => _EmotionSynthesisPageState();
}

class _EmotionSynthesisPageState extends State<EmotionSynthesisPage> {
  EmotionController emotionController = Get.put(EmotionController());
  bool noFace = true;

  @override
  void initState() {
    emotionController.loadCamera().then((value) {
      emotionController.startImageStream();
    });

    super.initState();
  }

  @override
  void dispose() {
    emotionController.cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<EmotionController>(
        builder: (_) {
          noFace = emotionController.label == SmileStatus.noFace;
          return Column(
            // alignment: Alignment.bottomCenter,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // if (!noFace)
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(emotionController.label?.name ?? ""),
                /*    child: LottieBuilder.asset(
                        'assets/lottie/done.json',
                        height: 150,
                        repeat: false,
                        onLoaded: (p0) {
                          Future.delayed(
                            Duration(
                                milliseconds: p0.duration.inMilliseconds + 300),
                            () {
                              Get.off(
                                () => AnalyzeMood(
                                  smileStatus: smileStatus!,
                                  coffee: getflavour(smileStatus!),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    */
              ),
              emotionController.cameraController != null &&
                      emotionController.cameraController!.value.isInitialized
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Transform.scale(
                        scale: 0.5,
                        child:
                            CameraPreview(emotionController.cameraController!),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}
