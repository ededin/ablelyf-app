import 'package:camera/camera.dart';
import 'package:newp/utils/utils.dart';

class CameraManager {
  CameraController? _controller;

  Future<CameraController?> load(position) async {
    _controller = CameraController(
      constants.cameras[position],
      ResolutionPreset.veryHigh,
      enableAudio: false,
    );
    await _controller?.initialize();
    return _controller;
  }

  CameraController? get controller => _controller;
}
