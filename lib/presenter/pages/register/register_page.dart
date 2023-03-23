import 'package:flutter/material.dart';
import 'package:streaming_app/presenter/widgets/button_gradient_widget.dart';
import 'package:streaming_app/presenter/widgets/checkbox_text_widget.dart';
import 'package:streaming_app/presenter/widgets/text_form_field_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Curta a viagem :)',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color(0xFFF6F6F6),
                ),
              ),
              Text(
                'SpaceFilms',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 40,
                  height: 1,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      stops: [0, 0.4, 0.8],
                      colors: [
                        Color(0xff564095),
                        Color(0xff564095),
                        Color(0xff684DB5),
                      ],
                    ).createShader(
                      const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                    ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Criar conta:',
                style: TextStyle(
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
              TextFormFieldWidget(
                label: 'Senha',
                obscureText: true,
                validator: (_) {},
              ),
              const SizedBox(height: 16),
              TextFormFieldWidget(
                label: 'Repita sua senha',
                obscureText: true,
                validator: (_) {},
              ),
              const SizedBox(height: 16),
              TextFormFieldWidget(
                label: 'E-mail',
                keyboardType: TextInputType.emailAddress,
                validator: (_) {},
              ),
              CheckboxTextWidget(
                text: 'Lembrar de mim',
                onChanged: (_) {},
              ),
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
