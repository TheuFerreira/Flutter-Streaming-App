import 'dart:convert';

import 'package:streaming_app/core/fetch/fetch.dart';
import 'package:streaming_app/infra/models/token_model.dart';

class UserService {
  final _fetch = Fetch();

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
}
