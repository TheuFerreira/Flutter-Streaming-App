import 'dart:convert';

import 'package:streaming_app/core/fetch/fetch.dart';
import 'package:streaming_app/core/fetch/fetch_errors.dart';
import 'package:streaming_app/domain/register/errors/register_errors.dart';
import 'package:streaming_app/domain/register/requests/register_request.dart';
import 'package:streaming_app/domain/register/responses/register_response.dart';

class RegisterCase {
  final _fetch = Fetch();

  Future<RegisterResponse?> call(RegisterRequest request) async {
    if (request.password != request.repeatPassword) {
      throw RegisterInvalidPasswordException();
    }

    final data = {
      'name': request.name,
      'email': request.email,
      'password': request.password,
    };

    final json = jsonEncode(data);
    try {
      final response = await _fetch.post<Map>(
        path: '/User/Register',
        data: json,
      );

      final mapResponse = response.data;
      final expiresAt = mapResponse['expires_at'];
      final inDate = DateTime.parse(expiresAt);
      final res = RegisterResponse(
        accessToken: mapResponse['access_token'],
        refreshToken: mapResponse['refresh_token'],
        expiresAt: inDate,
      );

      return res;
    } on FetchBadRequestException {
      throw RegisterInvalidEmailException();
    }
  }
}
