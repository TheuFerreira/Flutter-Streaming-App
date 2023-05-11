import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:streaming_app/presenter/pages/register/register_controller.dart';
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
                  'Curta a viagem :)',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  'SpaceFilms',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Criar conta:',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormFieldWidget(
                  label: 'Nome de usuário',
                  controller: controller.userController,
                  validator: Validatorless.multiple([
                    Validatorless.required('Campo não preenchido'),
                  ]),
                ),
                const SizedBox(height: 16),
                Observer(builder: (context) {
                  return PasswordFormFieldWidget(
                    label: 'Senha',
                    controller: controller.passwordController,
                    obscureText: controller.hidePassword,
                    onChanged: controller.onPasswordChange,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo não preenchido'),
                      Validatorless.min(8, 'Pelo menos 8 caracteres'),
                      Validatorless.regex(regSpecialCharacter,
                          'Pelo menos 1 caractere especial'),
                      Validatorless.max(16, 'Máximo de 16 caracteres'),
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
                        strengths: const [
                          PasswordStrength(
                            text: 'Fraca',
                            color: Color(0xFFFF6262),
                          ),
                          PasswordStrength(
                            text: 'Média',
                            color: Color(0xFFFFF50D),
                          ),
                          PasswordStrength(
                            text: 'Forte',
                            color: Color(0xFF43E728),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
                Observer(builder: (context) {
                  return PasswordFormFieldWidget(
                    label: 'Repita sua senha',
                    controller: controller.repeatPasswordController,
                    obscureText: controller.hideRepeatPassword,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo não preenchido'),
                      Validatorless.compare(controller.repeatPasswordController,
                          'As senhas não coincidem'),
                    ]),
                    onChangeObscureText: controller.changeHideRepeatPassword,
                  );
                }),
                const SizedBox(height: 16),
                TextFormFieldWidget(
                  label: 'E-mail',
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validatorless.multiple([
                    Validatorless.required('Campo não preenchido'),
                    Validatorless.email('E-mail inválido'),
                  ]),
                ),
                Observer(builder: (context) {
                  return CheckboxTextWidget(
                    text: 'Lembrar de mim',
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
                  child: const Text('Entrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
