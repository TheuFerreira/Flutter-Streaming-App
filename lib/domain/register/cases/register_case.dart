import 'package:streaming_app/domain/register/errors/register_errors.dart';
import 'package:streaming_app/domain/register/requests/register_request.dart';

class RegisterCase {
  Future<void> call(RegisterRequest request) async {
    if (request.password != request.repeatPassword) {
      throw RegisterInvalidPasswordException();
    }

    await Future.delayed(const Duration(seconds: 3));

    if (request.user == 'admin') {
      throw RegisterInvalidUserException();
    }

    if (request.email == 'admin@gmail.com') {
      throw RegisterInvalidEmailException();
    }
  }
}
