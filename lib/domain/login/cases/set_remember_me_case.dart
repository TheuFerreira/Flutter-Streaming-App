import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_app/domain/login/requests/remember_me_request.dart';

class SetRememberMeCase {
  Future<void> call(RememberMeRequest request) async {
    final prefs = await SharedPreferences.getInstance();
    if (!request.rememberMe) {
      await _deleteUserLogin(prefs);
      return;
    }

    final data = {
      'user': request.user,
      'password': request.password,
    };
    final json = jsonEncode(data);
    await prefs.setString('user_login', json);
  }

  Future<void> _deleteUserLogin(SharedPreferences prefs) async {
    final hasUserLogin = prefs.containsKey('user_login');
    if (hasUserLogin) {
      await prefs.remove('user_login');
    }
  }
}
