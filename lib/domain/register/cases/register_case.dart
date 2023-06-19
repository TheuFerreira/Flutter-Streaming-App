import 'package:injector/injector.dart';
import 'package:streaming_app/core/fetch/fetch_errors.dart';
import 'package:streaming_app/domain/register/errors/register_errors.dart';
import 'package:streaming_app/domain/register/requests/register_request.dart';
import 'package:streaming_app/infra/services/user_service.dart';

class RegisterCase {
  late UserService _userService;

  RegisterCase() {
    _userService = Injector.appInstance.get<UserService>();
  }

  Future<void> call(RegisterRequest request) async {
    if (request.password != request.repeatPassword) {
      throw RegisterInvalidPasswordException();
    }

    try {
      await _userService.register(
        request.name,
        request.email,
        request.password,
      );
    } on FetchBadRequestException {
      throw RegisterInvalidEmailException();
    }
  }
}
