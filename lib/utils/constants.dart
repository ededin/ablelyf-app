import '../ablelyf.dart';

class Constants {
  double screenHeight = 0;
  String get myId => FirebaseAuth.instance.currentUser?.uid ?? "";
  double screenWidth = 0;

  String profileImage =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';

  // String myID = '';
  Color themeColor = Colors.black;
  Color themeColor2 = Colors.black12;
  Color secondary = Colors.white;
  Color bg = const Color(0xffF2F5FF);
  Color lightgrey = const Color.fromARGB(255, 242, 241, 241);

  List<String> alphabet = List.generate(
      26, (index) => String.fromCharCode('A'.codeUnitAt(0) + index));
}

late Constants constants;
