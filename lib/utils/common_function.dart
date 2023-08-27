import '../ablelyf.dart';

class CommonFunction {
  snackbar(String text) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text(
      text,
      style: const TextStyle(
        fontSize: 14,
      ),
    )));
  }
}

late CommonFunction commonFunction;
