import 'dart:convert';

import 'package:injector/injector.dart';
import 'package:streaming_app/core/preferences/preferences.dart';
import 'package:streaming_app/domain/login/requests/remember_me_request.dart';

class SetRememberMeCase {
  late Preferences _preferences;

  SetRememberMeCase() {
    _preferences = Injector.appInstance.get<Preferences>();
  }

  Future<void> call(RememberMeRequest request) async {
    if (!request.rememberMe) {
      await _deleteUserLogin();
      return;
    }

    final data = {
      'user': request.user,
      'password': request.password,
    };
    final json = jsonEncode(data);

    await _preferences.save<String>('user_login', json);
  }

  Future<void> _deleteUserLogin() async {
    final hasUserLogin = await _preferences.contains('user_login');
    if (!hasUserLogin) return;

    await _preferences.remove('user_login');
  }
}
