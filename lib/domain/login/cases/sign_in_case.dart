import 'dart:convert';

import 'package:streaming_app/core/fetch/fetch.dart';
import 'package:streaming_app/core/fetch/fetch_errors.dart';
import 'package:streaming_app/domain/login/errors/login_errors.dart';
import 'package:streaming_app/domain/login/requests/sign_in_request.dart';
import 'package:streaming_app/domain/login/responses/sign_in_response.dart';

class SignInCase {
  final _fetch = Fetch();

  Future<SignInResponse> call(SignInRequest request) async {
    final email = request.email;
    final password = request.password;

    if (email.isEmpty || password.isEmpty) {
      throw LoginInvalidException();
    }

    final data = {
      'email': email,
      'password': password,
    };

    final json = jsonEncode(data);
    try {
      final response = await _fetch.post<Map>(path: '/User/SignIn', data: json);

      final mapResponse = response.data;
      final expiresAt = mapResponse['expires_at'];
      final inDate = DateTime.parse(expiresAt);

      final signInResponse = SignInResponse(
        accessToken: mapResponse['access_token'],
        refreshToken: mapResponse['refresh_token'],
        expiresAt: inDate,
      );
      return signInResponse;
    } on FetchNotFoundException {
      throw LoginInvalidException();
    } on FetchBadRequestException {
      throw LoginEmailNotRegisteredException();
    }
  }
}
