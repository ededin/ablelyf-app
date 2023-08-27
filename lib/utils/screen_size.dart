import '../ablelyf.dart';

extension ScreenUtils on num {
  double get sh => constants.screenHeight * this;
  double get sw => constants.screenWidth * this;
}
