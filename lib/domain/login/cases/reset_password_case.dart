import 'package:streaming_app/domain/login/errors/email_errors.dart';

class ResetPasswordCase {
  Future<void> call(String email) async {
    if (email.isEmpty) {
      throw EmailInvalidException();
    }

    if (email != 'admin@gmail.com') {
      throw EmailNotRegisteredException();
    }
  }
}
