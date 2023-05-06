import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_app/domain/login/errors/remember_errors.dart';
import 'package:streaming_app/domain/login/responses/user_login_response.dart';

class GetRememberMeCase {
  Future<UserLoginResponse> call() async {
    final prefs = await SharedPreferences.getInstance();
    final hasUserLogin = prefs.containsKey('user_login');
    if (!hasUserLogin) {
      throw RememberNotFoundException();
    }

    final json = prefs.getString('user_login')!;
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
