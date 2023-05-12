import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:streaming_app/presenter/pages/register/register_controller.dart';
import 'package:streaming_app/presenter/pages/register/register_page.i18n.dart';
import 'package:streaming_app/presenter/utils/regex.dart';
import 'package:streaming_app/presenter/widgets/button_gradient_widget.dart';
import 'package:streaming_app/presenter/widgets/checkbox_text_widget.dart';
import 'package:streaming_app/presenter/widgets/password_form_field_widget.dart';
import 'package:streaming_app/presenter/widgets/password_strength_widget.dart';
import 'package:streaming_app/presenter/widgets/text_form_field_widget.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                InkWell(
                  onTap: () => controller.login(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  enjoyJourney.i18n,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  spaceFilms.i18n,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 24),
                Text(
                  createAccount.i18n,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormFieldWidget(
                  label: userName.i18n,
                  hintText: typeHere.i18n,
                  controller: controller.userController,
                  validator: Validatorless.multiple([
                    Validatorless.required(fieldRequired.i18n),
                  ]),
                ),
                const SizedBox(height: 16),
                Observer(builder: (context) {
                  return PasswordFormFieldWidget(
                    label: password.i18n,
                    hintText: typeHere.i18n,
                    controller: controller.passwordController,
                    obscureText: controller.hidePassword,
                    onChanged: controller.onPasswordChange,
                    validator: Validatorless.multiple([
                      Validatorless.required(fieldRequired.i18n),
                      Validatorless.min(8, minChars.i18n),
                      Validatorless.regex(
                          regSpecialCharacter, specialCharacter.i18n),
                      Validatorless.max(16, maxChars.i18n),
                    ]),
                    onChangeObscureText: controller.changeHidePassword,
                  );
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Observer(builder: (context) {
                    return Visibility(
                      visible: controller.showStrength,
                      child: PasswordStrengthWidget(
                        baseColor: const Color(0xFFB6B6B6),
                        fill: controller.strength,
                        strengths: [
                          PasswordStrength(
                            text: weak.i18n,
                            color: const Color(0xFFFF6262),
                          ),
                          PasswordStrength(
                            text: average.i18n,
                            color: const Color(0xFFFFF50D),
                          ),
                          PasswordStrength(
                            text: strong.i18n,
                            color: const Color(0xFF43E728),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
                Observer(builder: (context) {
                  return PasswordFormFieldWidget(
                    label: repeatPassword.i18n,
                    hintText: typeHere.i18n,
                    controller: controller.repeatPasswordController,
                    obscureText: controller.hideRepeatPassword,
                    validator: Validatorless.multiple([
                      Validatorless.required(fieldRequired.i18n),
                      Validatorless.compare(controller.repeatPasswordController,
                          passwordsNotMatch.i18n),
                    ]),
                    onChangeObscureText: controller.changeHideRepeatPassword,
                  );
                }),
                const SizedBox(height: 16),
                TextFormFieldWidget(
                  label: email.i18n,
                  hintText: typeHere.i18n,
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validatorless.multiple([
                    Validatorless.required(fieldRequired.i18n),
                    Validatorless.email(invalidEmail.i18n),
                  ]),
                ),
                Observer(builder: (context) {
                  return CheckboxTextWidget(
                    text: rememberMe.i18n,
                    active: controller.rememberMe,
                    onChanged: controller.setRememberMe,
                  );
                }),
                const SizedBox(height: 40),
                ButtonGradientWidget(
                  gradient: const LinearGradient(
                    stops: [0, 0.5, 0.9],
                    colors: [
                      Color(0xFF684DB5),
                      Color(0xFF684DB5),
                      Color(0xFF684DB5),
                    ],
                  ),
                  onPressed: () => controller.register(context),
                  child: Text(enter.i18n),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
