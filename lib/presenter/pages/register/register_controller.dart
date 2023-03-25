import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:streaming_app/presenter/pages/register/dialogs/question_dialog.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  @observable
  bool rememberMe = false;

  @action
  Future<void> login(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (builder) {
        return const QuestionDialog(
          icon: Icons.question_mark,
          description: 'Deseja cancelar o processo\nde cadastro?',
          cancelButtonText: 'Não',
          okButtonText: 'Sim',
        );
      },
    );
    if (result != true) {
      return;
    }
    Navigator.of(context).pop();
  }

  @action
  void setRememberMe(bool value) {
    rememberMe = value;
  }
}
