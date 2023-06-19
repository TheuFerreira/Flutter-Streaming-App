import 'package:shared_preferences/shared_preferences.dart';

abstract class Preferences {
  Future<bool> save<T>(String key, T value);
  Future<dynamic> get<T>(String key);
  Future<bool> contains(String key);
  Future<bool> remove(String key);
}

class PreferencesImpl implements Preferences {
  @override
  Future<bool> save<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    if (T == String) {
      return prefs.setString(key, value as String);
    }

    throw UnimplementedError();
  }

  @override
  Future<dynamic> get<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (T == String) {
      return prefs.getString(key);
    }

    throw UnimplementedError();
  }

  @override
  Future<bool> contains(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  @override
  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove('user_login');
  }
}
