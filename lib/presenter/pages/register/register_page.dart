import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:streaming_app/presenter/pages/register/register_controller.dart';
import 'package:streaming_app/presenter/widgets/button_gradient_widget.dart';
import 'package:streaming_app/presenter/widgets/checkbox_text_widget.dart';
import 'package:streaming_app/presenter/widgets/password_form_field_widget.dart';
import 'package:streaming_app/presenter/widgets/text_form_field_widget.dart';

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
                validator: (_) {},
              ),
              const SizedBox(height: 16),
              PasswordFormFieldWidget(
                label: 'Senha',
                obscureText: true,
                validator: (_) {},
                onChangeObscureText: (_) {},
              ),
              const SizedBox(height: 16),
              PasswordFormFieldWidget(
                label: 'Repita sua senha',
                obscureText: true,
                validator: (_) {},
                onChangeObscureText: (_) {},
              ),
              const SizedBox(height: 16),
              TextFormFieldWidget(
                label: 'E-mail',
                keyboardType: TextInputType.emailAddress,
                validator: (_) {},
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
                onPressed: () {},
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
