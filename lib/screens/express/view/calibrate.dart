import '../../../ablelyf.dart';

class Calibrate extends StatefulWidget {
  const Calibrate({super.key});

  @override
  State<Calibrate> createState() => _CalibrateState();
}

class _CalibrateState extends State<Calibrate> {
  IrisController irisController = Get.put(IrisController());

  @override
  void initState() {
    irisController.loadCamera().then((value) async {
      await irisController.channel.invokeMethod("start");
      await irisController.startImageStream();
    });

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    // ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
