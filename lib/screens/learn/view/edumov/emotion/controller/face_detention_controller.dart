import '../../../../../../ablelyf.dart';
import '../../edumov.dart';

class FaceDetetorController {
  /*  FaceDetector? _faceDetector;

  Future<List<FaceModel>?> processImage(InputImage inputImage) async {
    _faceDetector = GoogleMlKit.vision.faceDetector(
      FaceDetectorOptions(
        enableClassification: true,
        enableLandmarks: true,
      ),
    );

    final faces = await _faceDetector?.processImage(inputImage);
    return extractFaceInfo(faces);
  }

  List<FaceModel>? extractFaceInfo(List<Face>? faces) {
    List<FaceModel>? response = [];
    double? smile;
    double? leftYears;
    double? rightYears;

    for (Face face in faces!) {
      final rect = face.boundingBox;
      if (face.smilingProbability != null) {
        smile = face.smilingProbability;
      }

      leftYears = face.leftEyeOpenProbability;
      rightYears = face.rightEyeOpenProbability;

      final faceModel = FaceModel(
        smile: smile,
        leftYearsOpen: leftYears,
        rightYearsOpen: rightYears,
      );

      response.add(faceModel);
    }

    return response;
  } */
}
