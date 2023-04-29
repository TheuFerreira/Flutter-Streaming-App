import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:streaming_app/presenter/pages/login/dialogs/info_dialog.dart';
import 'package:streaming_app/presenter/pages/login/dialogs/text_dialog.dart';
import 'package:streaming_app/presenter/pages/register/register_page.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final formKey = GlobalKey<FormState>();

  @observable
  bool rememberMe = false;

  @observable
  bool obscureText = true;

  @action
  Future<void> resetPassword(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) {
        return TextDialog(
          icon: Icons.email,
          description:
              'Confirme seu e-mail para o\nenvio da redefinição de senha:',
          cancelButtonText: 'Sair',
          okButtonText: 'Enviar',
          onOkButton: () {},
        );
      },
    );

    await showDialog(
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

    await showDialog(
      context: context,
      builder: (_) {
        return TextDialog(
          icon: Icons.email,
          description: 'E-mail incorreto, por favor\ndigite novamente:',
          cancelButtonText: 'Sair',
          okButtonText: 'Enviar',
          onOkButton: () {},
        );
      },
    );
  }

  @action
  void onChangeObscureText(bool value) {
    obscureText = !value;
  }

  @action
  void setRememberMe(bool value) {
    rememberMe = value;
  }

  @action
  void signIn(BuildContext context) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

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
