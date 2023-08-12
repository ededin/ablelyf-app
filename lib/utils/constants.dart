import '../ablelyf.dart';

class Constants {
  double screenHeight = 0;
  double screenWidth = 0;

  Color themeColor = Colors.black;
  Color themeColor2 = Colors.black12;
  Color secondary = Colors.white;
  Color bg = const Color(0xffF2F5FF);

  List<String> alphabet = List.generate(
      26, (index) => String.fromCharCode('A'.codeUnitAt(0) + index));

  List<Pharses> customPharses = [];

  late final SharedPreferences sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    customPharses = (sharedPreferences.getStringList('customPharses') ?? [])
        .map((e) => Pharses.fromJson(e))
        .toList();
  }
}

late Constants constants;
