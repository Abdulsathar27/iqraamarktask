import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<void> saveLoginTime() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      "last_login",
      DateTime.now().toString(),
    );
  }

  static Future<String?> getLoginTime() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("last_login");
  }
}