import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Future<bool> save<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    if (T == String) {
      return prefs.setString(key, value as String);
    }

    throw UnimplementedError();
  }

  Future<dynamic> get<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (T == String) {
      return prefs.getString(key);
    }

    throw UnimplementedError();
  }

  Future<bool> contains(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove('user_login');
  }
}
