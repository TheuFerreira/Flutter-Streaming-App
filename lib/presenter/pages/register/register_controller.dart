import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:streaming_app/domain/login/cases/set_remember_me_case.dart';
import 'package:streaming_app/domain/login/requests/remember_me_request.dart';
import 'package:streaming_app/domain/register/cases/register_case.dart';
import 'package:streaming_app/domain/register/errors/register_errors.dart';
import 'package:streaming_app/domain/register/requests/register_request.dart';
import 'package:streaming_app/presenter/dialogs/error_dialog.dart';
import 'package:streaming_app/presenter/dialogs/loading_dialog.dart';
import 'package:streaming_app/presenter/pages/main_page/main_page.dart';
import 'package:streaming_app/presenter/pages/register/dialogs/question_dialog.dart';
import 'package:streaming_app/presenter/utils/regex.dart';
import 'package:validatorless/validatorless.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final emailController = TextEditingController();

  @observable
  bool hidePassword = true;

  @observable
  int strength = 0;

  @computed
  bool get showStrength => strength > 0;

  @observable
  bool hideRepeatPassword = true;

  @observable
  bool rememberMe = false;

  final _registerCase = RegisterCase();
  final _setRememberMeCase = SetRememberMeCase();

  @action
  Future<void> login(BuildContext context) async {
    showDialog(
      context: context,
      builder: (builder) {
        return const QuestionDialog(
          icon: Icons.question_mark,
          description: 'Deseja cancelar o processo\nde cadastro?',
          cancelButtonText: 'Não',
          okButtonText: 'Sim',
        );
      },
    ).then((value) {
      if (value != true) {
        return;
      }

      Navigator.of(context).pop();
    });
  }

  @action
  void changeHidePassword(bool value) {
    hidePassword = !value;
  }

  @action
  void onPasswordChange(String value) {
    strength = 0;
    String? result = Validatorless.required('Campo não preenchido').call(value);
    if (result == null || result.isEmpty) {
      strength++;
    } else {
      return;
    }

    result = Validatorless.min(8, 'Pelo menos 8 caracteres').call(value);
    if (result == null || result.isEmpty) {
      strength++;
    }

    result = Validatorless.regex(
            regSpecialCharacter, 'Pelo menos 1 caractere especial')
        .call(value);
    if (result == null || result.isEmpty) {
      strength++;
    }

    result = Validatorless.max(16, 'Máximo de 16 caracteres').call(value);
    if (result == null || result.isEmpty) {
      strength++;
    }

    strength--;
  }

  @action
  void changeHideRepeatPassword(bool value) {
    hideRepeatPassword = !value;
  }

  @action
  void setRememberMe(bool value) {
    rememberMe = value;
  }

  void register(BuildContext context) {
    if (!_formIsValid()) return;

    LoadingDialog.show(context);

    final registerRequest = RegisterRequest(
      user: userController.text,
      password: passwordController.text,
      repeatPassword: repeatPasswordController.text,
      email: emailController.text,
    );

    _registerCase(registerRequest)
        .then((_) => _successRegister(context))
        .catchError((_) => _invalidUser(context),
            test: (e) => e is RegisterInvalidUserException)
        .catchError((_) => _invalidEmail(context),
            test: (e) => e is RegisterInvalidEmailException)
        .catchError((_) => _genericError(context));
  }

  void _successRegister(BuildContext context) {
    LoadingDialog.close(context);

    final rememberMeRequest = RememberMeRequest(
      user: userController.text,
      password: passwordController.text,
      rememberMe: rememberMe,
    );

    _setRememberMeCase(rememberMeRequest).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (builder) => const MainPage(),
      ));
    });
  }

  void _invalidUser(BuildContext context) {
    LoadingDialog.close(context);

    showDialog(
      context: context,
      builder: (builder) {
        return const ErrorDialog(
          description: 'Escolha outro usuário',
        );
      },
    );
  }

  void _genericError(BuildContext context) {
    LoadingDialog.close(context);

    showDialog(
      context: context,
      builder: (builder) {
        return const ErrorDialog(
          description: 'Ocorreu um problema desconhecido',
        );
      },
    );
  }

  void _invalidEmail(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return const ErrorDialog(
          description: 'Escolha outro E-mail',
        );
      },
    );
  }

  bool _formIsValid() {
    final result = formKey.currentState!.validate();
    return result;
  }
}
