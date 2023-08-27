import '../ablelyf.dart';

class AppSharedPreference {
  late final SharedPreferences sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setString(key, value) {
    return sharedPreferences.setString(key, value);
  }

  String? getString(key) {
    return sharedPreferences.getString(key);
  }
}

AppSharedPreference appSharedPreference = AppSharedPreference();
