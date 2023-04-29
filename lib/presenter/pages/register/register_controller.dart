import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:streaming_app/presenter/pages/register/dialogs/question_dialog.dart';
import 'package:streaming_app/presenter/utils/regex.dart';
import 'package:validatorless/validatorless.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final formKey = GlobalKey<FormState>();

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
}
