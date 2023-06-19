import 'dart:convert';

import 'package:injector/injector.dart';
import 'package:streaming_app/core/fetch/fetch.dart';
import 'package:streaming_app/infra/models/token_model.dart';

class UserService {
  late Fetch _fetch;

  UserService() {
    _fetch = Injector.appInstance.get<Fetch>();
  }

  Future<TokenModel> signIn(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };

    final json = jsonEncode(data);
    final response = await _fetch.post<Map<String, dynamic>>(
      path: '/User/SignIn',
      data: json,
    );

    final model = TokenModel.fromMap(response.data);
    return model;
  }

  Future<void> register(
    String name,
    String email,
    String password,
  ) async {
    final data = {
      'name': name,
      'email': email,
      'password': password,
    };

    final json = jsonEncode(data);
    await _fetch.post(
      path: '/User/Register',
      data: json,
    );
  }

  Future<void> resetPassword(String email) async {
    final map = {
      'email': email,
    };

    final json = jsonEncode(map);
    await _fetch.post(path: '/User/ResetPassword', data: json);
  }
}
