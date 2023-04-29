import 'package:streaming_app/domain/login/errors/login_errors.dart';
import 'package:streaming_app/domain/login/requests/sign_in_request.dart';
import 'package:streaming_app/domain/login/responses/sign_in_response.dart';

class SignInCase {
  Future<SignInResponse> call(SignInRequest request) async {
    final user = request.user;
    final password = request.password;

    if (user.isEmpty || password.isEmpty) {
      throw LoginInvalidException();
    }

    await Future.delayed(const Duration(seconds: 3));

    if (user == 'error') {
      throw Exception();
    } else if (user != 'admin') {
      throw LoginEmailNotRegisteredException();
    }

    const response = SignInResponse(userId: 1);
    return response;
  }
}
