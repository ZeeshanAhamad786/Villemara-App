import 'package:shared_preferences/shared_preferences.dart';
class MySharedPreferences {
  static late SharedPreferences _preferences;
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }
  static Future<void> reload() async {
    _preferences.reload();
  }
  static containKey(String key) {
    return _preferences.containsKey(key);
  }
  static setString(String key, String value) {
    return _preferences.setString(key, value);
  }
  static String getString(String key) {
    return _preferences.getString(key) ?? "";
  }
// You can add similar functions for other data types as needed
// Example:
  static setBool(String key, bool value) {
    return _preferences.setBool(key, value);
  }

  static bool getBool(String key) {
    return _preferences.getBool(key) ?? false;
  }

  static removeKey(String key) {
    return _preferences.remove(key) ?? '';
  }
// Add more functions as per your requirements
}