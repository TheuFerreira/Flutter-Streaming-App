import 'dart:convert';

import 'package:streaming_app/core/fetch/fetch.dart';
import 'package:streaming_app/infra/models/token_model.dart';

abstract class UserService {
  Future<TokenModel> signIn(String email, String password);
  Future<void> register(
    String name,
    String email,
    String password,
  );
  Future<void> resetPassword(String email);
}

class UserServiceImpl implements UserService {
  final Fetch _fetch;

  UserServiceImpl(this._fetch);

  @override
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

  @override
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

  @override
  Future<void> resetPassword(String email) async {
    final map = {
      'email': email,
    };

    final json = jsonEncode(map);
    await _fetch.post(path: '/User/ResetPassword', data: json);
  }
}
