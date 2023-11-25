import 'dart:io';

import '../../../../../../ablelyf.dart';

class ObjectController extends GetxController {
  ObjectCameraManager? _cameraManager;
  CameraController? cameraController;
  final FlutterTts flutterTts = FlutterTts();

  int _cameraIndex = -1;

  bool _isDetecting = false;
  List<ImageLabel> faces = [];
  String faceAtMoment = '';
  SmileStatus? label = SmileStatus.noFace;

  ObjectController() {
    flutterTts.setLanguage("en-US");

    _cameraManager = ObjectCameraManager();
  }

  Future<void> speak(text) async {
    await flutterTts.setVolume(0.5);
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.speak(text);
  }

  Future<void> loadCamera() async {
    // int position = constants.cameras.length > 1 ? 1 : 0;
    int position = 0;

    _cameraIndex = position;

    cameraController = await _cameraManager?.load(position);
    update();
  }

  Future<void> switchCamera() async {
    await cameraController?.stopImageStream();

    final lensDirection = cameraController?.description.lensDirection;

    int postion;

    if (lensDirection == CameraLensDirection.front) {
      postion = constants.cameras.indexWhere((description) =>
          description.lensDirection == CameraLensDirection.back);
    } else {
      postion = constants.cameras.indexWhere((description) =>
          description.lensDirection == CameraLensDirection.front);
    }

    if (postion != -1) {
      _cameraIndex = postion;

      cameraController = await _cameraManager?.load(postion);

      startImageStream();
    }

    update();
  }

  Future<void> startImageStream() async {
    // CameraDescription camera = cameraController!.description;

    cameraController?.startImageStream((cameraImage) async {
      if (_isDetecting) return;
      _isDetecting = true;

      // MethodChannel channel = MethodChannel('imageShare');

      // channel.invokeMethod(
      //   'imageStream',
      //   {
      //     'planeBuffer': cameraImage.planes[0].bytes.buffer.asUint8List(),
      //     'height': cameraImage.height,
      //     'width': cameraImage.width,
      //     'rotation': camera.sensorOrientation.toDouble(),
      //   },
      // ).then((value) => _isDetecting = false);

      /*     final planeData = cameraImage.planes.map(
        (Plane plane) {
          return InputImageMetadata(
            bytesPerRow: plane.bytesPerRow,
            size: Size(
                (plane.width ?? 0).toDouble(), (plane.height ?? 0).toDouble()),
            format: inputImageFormat,
            rotation: imageRotation,
          );
        },
      ).toList(); */

      final inputImage = _inputImageFromCameraImage(cameraImage);

      if (inputImage != null) {
        processImage(inputImage);
      } else {
        _isDetecting = false;
      }
    });
  }

  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    if (cameraController == null) return null;

    // get image rotation
    // it is used in android to convert the InputImage from Dart to Java: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/android/src/main/java/com/google_mlkit_commons/InputImageConverter.java
    // `rotation` is not used in iOS to convert the InputImage from Dart to Obj-C: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/ios/Classes/MLKVisionImage%2BFlutterPlugin.m
    // in both platforms `rotation` and `camera.lensDirection` can be used to compensate `x` and `y` coordinates on a canvas: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/example/lib/vision_detector_views/painters/coordinates_translator.dart
    final camera = constants.cameras[_cameraIndex];
    final sensorOrientation = camera.sensorOrientation;
    // print(
    //     'lensDirection: ${camera.lensDirection}, sensorOrientation: $sensorOrientation, ${_controller?.value.deviceOrientation} ${_controller?.value.lockedCaptureOrientation} ${_controller?.value.isCaptureOrientationLocked}');
    InputImageRotation? rotation;
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation =
          _orientations[cameraController!.value.deviceOrientation];
      if (rotationCompensation == null) return null;
      if (camera.lensDirection == CameraLensDirection.front) {
        // front-facing
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        // back-facing
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
      // print('rotationCompensation: $rotationCompensation');
    }
    if (rotation == null) return null;
    // print('final rotation: $rotation');

    // get image format
    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    // validate format depending on platform
    // only supported formats:
    // * nv21 for Android
    // * bgra8888 for iOS
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) return null;

    // since format is constraint to nv21 or bgra8888, both only have one plane
    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    // compose InputImage using bytes
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation, // used only in Android
        format: format, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),
    );
  }

  Future<void> processImage(inputImage) async {
    const path = 'assets/models/object_labeler.tflite';

    final modelPath = await getAssetPath(path);

    final LocalLabelerOptions options =
        LocalLabelerOptions(confidenceThreshold: 0.5, modelPath: modelPath);

    final imageLabeler = ImageLabeler(options: options);

    faces = await imageLabeler.processImage(inputImage);

    if (faces.isNotEmpty) {
      faces.sort((a, b) => b.confidence.compareTo(a.confidence));
      print(
          'FACES: ${faces.map((e) => "${e.label} ${e.index} ${e.confidence}")}');

      faceAtMoment = "${faces.first.label} is Ahead";

      await Future.delayed(const Duration(seconds: 3));
    } else {
      faceAtMoment = '';
      // label = SmileStatus.noFace;
    }
    _isDetecting = false;
    update();
    if (faceAtMoment.isNotEmpty) {
      speak(faceAtMoment);
    }
  }

  SmileStatus detectSmile(smileProb) {
    if (smileProb > 0.86) {
      faceAtMoment = 'happy_face.png';
      return SmileStatus.bigSmileWithTeeth;
    } else if (smileProb > 0.8) {
      faceAtMoment = 'happy_face.png';
      return SmileStatus.bigSmile;
    } else if (smileProb > 0.3) {
      faceAtMoment = 'happy_face.png';
      return SmileStatus.smile;
    } else if (smileProb > 0.05) {
      faceAtMoment = 'happy_face.png';
      return SmileStatus.normal;
    } else {
      faceAtMoment = 'sady_face.png';
      return SmileStatus.sad;
    }
  }
}
