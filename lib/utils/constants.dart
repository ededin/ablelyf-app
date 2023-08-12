import '../ablelyf.dart';

class Constants {
  double screenHeight = 0;
  double screenWidth = 0;

  Color themeColor = const Color(0xFF114FFF);
  Color secondary = const Color(0xff7998ff);
  Color bg = const Color(0xffF2F5FF);
  Color lightgrey = const Color.fromARGB(255, 242, 241, 241);

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
