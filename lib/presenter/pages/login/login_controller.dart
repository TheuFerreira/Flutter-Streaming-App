import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:streaming_app/domain/login/cases/get_remember_me_case.dart';
import 'package:streaming_app/domain/login/cases/reset_password_case.dart';
import 'package:streaming_app/domain/login/cases/set_remember_me_case.dart';
import 'package:streaming_app/domain/login/cases/sign_in_case.dart';
import 'package:streaming_app/domain/login/errors/login_errors.dart';
import 'package:streaming_app/domain/login/errors/remember_errors.dart';
import 'package:streaming_app/domain/login/requests/remember_me_request.dart';
import 'package:streaming_app/domain/login/requests/sign_in_request.dart';
import 'package:streaming_app/presenter/dialogs/error_dialog.dart';
import 'package:streaming_app/presenter/dialogs/info_dialog.dart';
import 'package:streaming_app/presenter/dialogs/loading_dialog.dart';
import 'package:streaming_app/presenter/pages/login/dialogs/text_dialog.dart';
import 'package:streaming_app/presenter/pages/login/login_controller.i18n.dart';
import 'package:streaming_app/presenter/pages/main/main_page.dart';
import 'package:streaming_app/presenter/pages/register/register_page.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @observable
  bool rememberMe = false;

  @observable
  bool obscureText = true;

  final _signInCase = SignInCase();
  final _resetPasswordCase = ResetPasswordCase();
  final _setRememberMeCase = SetRememberMeCase();
  final _getRememberMeCase = GetRememberMeCase();

  @action
  void load() {
    _getRememberMeCase().then((value) {
      emailController.text = value.user;
      passwordController.text = value.password;
      rememberMe = true;
    }).catchError((onError) {
      emailController.text = '';
      passwordController.text = '';
      rememberMe = false;
    }, test: (err) => err is RememberException);
  }

  @action
  void resetPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return TextDialog(
          controller: emailController,
          icon: Icons.email,
          description: confirmEmail.i18n,
          cancelButtonText: exit.i18n,
          okButtonText: sent.i18n,
          onOkButton: () => _sendEmailResetPassword(context),
        );
      },
    );
  }

  _sendEmailResetPassword(BuildContext context) {
    final email = emailController.text;
    LoadingDialog.show(context);

    _resetPasswordCase(email)
        .then((value) => _emailSent(context))
        .catchError((onError) => _emailNotFound(context))
        .whenComplete(() {
      emailController.clear();
    });
  }

  _emailSent(BuildContext context) {
    LoadingDialog.close(context);
    showDialog(
      context: context,
      builder: (builder) {
        return InfoDialog(
          icon: Icons.email,
          description: emailResetPassword.i18n,
          buttonText: ok.i18n,
        );
      },
    );
  }

  _emailNotFound(BuildContext context) {
    LoadingDialog.close(context);
    showDialog(
      context: context,
      builder: (_) {
        return InfoDialog(
          icon: Icons.email,
          description: invalidEmail.i18n,
          buttonText: ok.i18n,
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

    LoadingDialog.show(context);

    final request = SignInRequest(
      email: emailController.text,
      password: passwordController.text,
    );

    _signInCase(request)
        .then((value) => _signInSuccess(context, value))
        .catchError(
          (err) => _emailNotRegisteredError(context, err),
          test: (err) => err is LoginEmailNotRegisteredException,
        )
        .catchError(
          (err) => _invalidLoginError(context, err),
          test: (err) => err is LoginException,
        )
        .catchError(
          (err) => _unknownError(context, err),
        );
  }

  _signInSuccess(BuildContext context, dynamic value) {
    final request = RememberMeRequest(
      user: emailController.text,
      password: passwordController.text,
      rememberMe: rememberMe,
    );
    _setRememberMeCase(request).whenComplete(() {
      LoadingDialog.close(context);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (builder) => const MainPage()),
      );
    });
  }

  _emailNotRegisteredError(BuildContext context, dynamic err) {
    LoadingDialog.close(context);

    showDialog(
      context: context,
      builder: (builder) {
        return InfoDialog(
          icon: Icons.email,
          description: notConfirmedEmail.i18n,
          buttonText: ok.i18n,
        );
      },
    );
  }

  _invalidLoginError(BuildContext context, dynamic err) {
    LoadingDialog.close(context);

    showDialog(
      context: context,
      builder: (builder) {
        return InfoDialog(
          icon: Icons.warning,
          iconColor: Colors.yellow,
          description: invalidUserOrPassword.i18n,
          buttonText: ok.i18n,
        );
      },
    );
  }

  _unknownError(BuildContext context, dynamic err) {
    LoadingDialog.close(context);

    showDialog(
      context: context,
      builder: (builder) {
        return ErrorDialog(
          description: internalError.i18n,
          buttonText: tryAgain.i18n,
        );
      },
    );
  }

  void register(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (builder) => const RegisterPage()),
    );
  }
}
