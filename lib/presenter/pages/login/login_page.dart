import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:streaming_app/presenter/pages/login/login_controller.dart';
import 'package:streaming_app/presenter/widgets/button_gradient_widget.dart';
import 'package:streaming_app/presenter/widgets/checkbox_text_widget.dart';
import 'package:streaming_app/presenter/widgets/password_form_field_widget.dart';
import 'package:streaming_app/presenter/widgets/text_form_field_widget.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topRight,
                fit: BoxFit.fitWidth,
                image: Image.asset('assets/images/login/background.png').image,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        Text(
                          'Curta a viagem :)',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          'SpaceFilms',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Form(
                            key: controller.formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextFormFieldWidget(
                                  label: 'Usuário',
                                  validator: Validatorless.multiple([
                                    Validatorless.required(
                                        'Campo não preenchido'),
                                  ]),
                                ),
                                const SizedBox(height: 24),
                                Observer(builder: (context) {
                                  return PasswordFormFieldWidget(
                                    label: 'Senha',
                                    obscureText: controller.obscureText,
                                    validator: Validatorless.multiple([
                                      Validatorless.required(
                                          'Campo não preenchido'),
                                    ]),
                                    onChangeObscureText:
                                        controller.onChangeObscureText,
                                  );
                                }),
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.end,
                            text: TextSpan(
                              text: 'Esqueceu sua senha?',
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => controller.resetPassword(context),
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Observer(builder: (context) {
                            final rememberMe = controller.rememberMe;
                            return CheckboxTextWidget(
                              text: 'Lembrar de mim',
                              active: rememberMe,
                              onChanged: controller.setRememberMe,
                            );
                          }),
                          ButtonGradientWidget(
                            gradient: const LinearGradient(
                              stops: [0, 0.5, 0.9],
                              colors: [
                                Color(0xFF684DB5),
                                Color(0xFF684DB5),
                                Color(0xFF684DB5),
                              ],
                            ),
                            onPressed: () => controller.signIn(context),
                            child: const Text('Entrar'),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Não possui uma conta? ',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w200,
                                fontSize: 12,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Cadastre-se',
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =
                                        () => controller.register(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
