import 'package:injector/injector.dart';
import 'package:streaming_app/core/fetch/fetch_errors.dart';
import 'package:streaming_app/domain/login/errors/login_errors.dart';
import 'package:streaming_app/domain/login/requests/sign_in_request.dart';
import 'package:streaming_app/domain/login/responses/sign_in_response.dart';
import 'package:streaming_app/infra/services/user_service.dart';

class SignInCase {
  late UserService _userService;

  SignInCase() {
    _userService = Injector.appInstance.get<UserService>();
  }

  Future<SignInResponse> call(SignInRequest request) async {
    final email = request.email;
    final password = request.password;

    if (email.isEmpty || password.isEmpty) {
      throw LoginInvalidException();
    }

    try {
      final response = await _userService.signIn(email, password);
      final inDate = DateTime.parse(response.expiresAt);

      final signInResponse = SignInResponse(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
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
