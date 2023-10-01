import 'package:newp/ablelyf.dart';

class VocalController extends GetxController {
  String? result;

  void updateResult(String? result) {
    this.result = result;
    update();
  }
}
