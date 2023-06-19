import 'dart:convert';

import 'package:streaming_app/core/fetch/fetch.dart';
import 'package:streaming_app/infra/models/token_model.dart';
import 'package:streaming_app/infra/models/user_info_model.dart';

abstract class UserService {
  Future<TokenModel> signIn(String email, String password);
  Future<void> register(
    String name,
    String email,
    String password,
  );
  Future<void> resetPassword(String email);
  Future<UserInfoModel> getUserInfo();
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
      headers: {'no_bearer': true},
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
      headers: {'no_bearer': true},
    );
  }

  @override
  Future<void> resetPassword(String email) async {
    final map = {
      'email': email,
    };

    final json = jsonEncode(map);
    await _fetch.post(
      path: '/User/ResetPassword',
      data: json,
      headers: {'no_bearer': true},
    );
  }

  @override
  Future<UserInfoModel> getUserInfo() async {
    final response = await _fetch.get<Map<String, dynamic>>(path: '/User/Info');
    final model = UserInfoModel.fromMap(response.data);
    return model;
  }
}
