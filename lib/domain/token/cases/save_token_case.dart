import 'dart:convert';

import 'package:injector/injector.dart';
import 'package:streaming_app/core/preferences/preferences.dart';
import 'package:streaming_app/domain/token/requests/token_request.dart';
import 'package:streaming_app/infra/models/token_model.dart';

class SaveTokenCase {
  late Preferences _preferences;

  SaveTokenCase() {
    _preferences = Injector.appInstance.get<Preferences>();
  }

  Future<void> call(TokenRequest request) async {
    final model = TokenModel.factory(
      accessToken: request.accessToken,
      refreshToken: request.refreshToken,
      expiresAt: request.expiresAt.toString(),
    );
    final json = jsonEncode(model.toMap());

    await _preferences.save<String>('token', json);
  }
}
