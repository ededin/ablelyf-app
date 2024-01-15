import 'dart:io';

import 'package:camera/camera.dart';
import 'package:newp/utils/utils.dart';

class IrisCameraManager {
  CameraController? _controller;

  Future<CameraController?> load(position) async {
    _controller = CameraController(
      constants.cameras[position],
      ResolutionPreset.veryHigh,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.bgra8888 // for Android
          : ImageFormatGroup.bgra8888,
    );
    await _controller?.initialize();

    return _controller;
  }

  CameraController? get controller => _controller;
}
