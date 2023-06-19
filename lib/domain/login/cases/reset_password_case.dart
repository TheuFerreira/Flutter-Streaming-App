import 'package:injector/injector.dart';
import 'package:streaming_app/core/fetch/fetch_errors.dart';
import 'package:streaming_app/domain/login/errors/email_errors.dart';
import 'package:streaming_app/infra/services/user_service.dart';

class ResetPasswordCase {
  late UserService _userService;

  ResetPasswordCase() {
    _userService = Injector.appInstance.get<UserService>();
  }

  Future<void> call(String email) async {
    if (email.isEmpty) {
      throw EmailInvalidException();
    }

    try {
      await _userService.resetPassword(email);
    } on FetchNotFoundException {
      throw EmailNotRegisteredException();
    }
  }
}
