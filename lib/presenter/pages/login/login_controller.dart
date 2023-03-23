import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:streaming_app/presenter/pages/login/dialogs/info_dialog.dart';
import 'package:streaming_app/presenter/pages/register/register_page.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  @observable
  bool rememberMe = false;

  @action
  void resetPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return const InfoDialog(
          icon: Icons.email,
          description:
              'Um link para redefinição\nde senha foi enviado para\nseu e-mail!',
          buttonText: 'Ok',
        );
      },
    );
  }

  @action
  void setRememberMe(bool value) {
    rememberMe = value;
  }

  @action
  void signIn(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return const InfoDialog(
          icon: Icons.email,
          description: 'Você ainda não\nconfirmou seu e-mail!',
          buttonText: 'Ok',
        );
      },
    );

    showDialog(
      context: context,
      builder: (builder) {
        return const InfoDialog(
          icon: Icons.error,
          iconColor: Colors.red,
          description: 'Ocorreu algum erro interno,\ntente novamente!',
          buttonText: 'Tentar novamente',
        );
      },
    );

    showDialog(
      context: context,
      builder: (builder) {
        return const InfoDialog(
          icon: Icons.warning,
          iconColor: Colors.yellow,
          description: 'Usuário ou senha\nincorretos!',
          buttonText: 'Ok',
        );
      },
    );
  }

  @action
  void register(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (builder) => const RegisterPage()),
    );
  }
}
