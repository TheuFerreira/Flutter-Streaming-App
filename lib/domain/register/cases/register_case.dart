import 'package:streaming_app/core/fetch/fetch_errors.dart';
import 'package:streaming_app/domain/register/errors/register_errors.dart';
import 'package:streaming_app/domain/register/requests/register_request.dart';
import 'package:streaming_app/domain/register/responses/register_response.dart';
import 'package:streaming_app/infra/services/user_service.dart';

class RegisterCase {
  final _userService = UserService();

  Future<RegisterResponse?> call(RegisterRequest request) async {
    if (request.password != request.repeatPassword) {
      throw RegisterInvalidPasswordException();
    }

    try {
      final model = await _userService.register(
        request.name,
        request.email,
        request.password,
      );

      final inDate = DateTime.parse(model.expiresAt);
      final response = RegisterResponse(
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
        expiresAt: inDate,
      );

      return response;
    } on FetchBadRequestException {
      throw RegisterInvalidEmailException();
    }
  }
}
