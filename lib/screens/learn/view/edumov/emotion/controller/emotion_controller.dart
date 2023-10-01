import '../../../../../../ablelyf.dart';

enum SmileStatus {
  noFace,
  normal,
  smile,
  bigSmile,
  bigSmileWithTeeth,
  sad,
}

class EmotionController extends GetxController {
  CameraManager? _cameraManager;
  CameraController? cameraController;
  FaceDetetorController? _faceDetect;
  bool _isDetecting = false;
  List<FaceModel>? faces;
  String? faceAtMoment = 'normal_face.png';
  SmileStatus? label = SmileStatus.noFace;

  EmotionController() {
    _cameraManager = CameraManager();
    _faceDetect = FaceDetetorController();
  }

  Future<void> loadCamera() async {
    cameraController = await _cameraManager?.load();
    update();
  }

  Future<void> startImageStream() async {
    CameraDescription camera = cameraController!.description;

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

      final WriteBuffer allBytes = WriteBuffer();
      for (Plane plane in cameraImage.planes) {
        allBytes.putUint8List(plane.bytes);
      }
      final bytes = allBytes.done().buffer.asUint8List();

      final Size imageSize =
          Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());

      final InputImageRotation imageRotation =
          InputImageRotationValue.fromRawValue(camera.sensorOrientation) ??
              InputImageRotation.rotation0deg;

      final InputImageFormat inputImageFormat =
          InputImageFormatValue.fromRawValue(cameraImage.format.raw) ??
              InputImageFormat.nv21;

      final planeData = cameraImage.planes.map(
        (Plane plane) {
          return InputImageMetadata(
            bytesPerRow: plane.bytesPerRow,
            size: Size(
                (plane.width ?? 0).toDouble(), (plane.height ?? 0).toDouble()),
            format: inputImageFormat,
            rotation: imageRotation,
          );
        },
      ).toList();

      final inputImageData = InputImageMetadata(
        size: imageSize,
        rotation: imageRotation,
        format: inputImageFormat,
        bytesPerRow: 0,
      );

      final inputImage = InputImage.fromBytes(
        bytes: bytes,
        metadata: inputImageData,
      );

      processImage(inputImage);
    });
  }

  Future<void> processImage(inputImage) async {
    faces = await _faceDetect?.processImage(inputImage);

    if (faces != null && faces!.isNotEmpty) {
      FaceModel? face = faces?.first;
      label = detectSmile(face?.smile);
    } else {
      faceAtMoment = 'normal_face.png';
      label = SmileStatus.noFace;
    }
    _isDetecting = false;
    update();
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
