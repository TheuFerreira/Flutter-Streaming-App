import 'package:streaming_app/domain/login/errors/email_errors.dart';

class ResetPasswordCase {
  Future<void> call(String email) async {
    if (email.isEmpty) {
      throw EmailInvalidException();
    }

    await Future.delayed(const Duration(seconds: 2));

    if (email != 'admin@gmail.com') {
      throw EmailNotRegisteredException();
    }
  }
}
