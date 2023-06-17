import 'dart:convert';

import 'package:streaming_app/core/preferences/preferences.dart';
import 'package:streaming_app/domain/login/errors/remember_errors.dart';
import 'package:streaming_app/domain/login/responses/user_login_response.dart';

class GetRememberMeCase {
  final _preferences = Preferences();

  Future<UserLoginResponse> call() async {
    final hasUserLogin = await _preferences.contains('user_login');
    if (!hasUserLogin) {
      throw RememberNotFoundException();
    }

    final json = await _preferences.get<String>('user_login');
    final map = jsonDecode(json);

    final user = map['user'];
    final password = map['password'];

    final userLogin = UserLoginResponse(
      user: user,
      password: password,
    );
    return userLogin;
  }
}
