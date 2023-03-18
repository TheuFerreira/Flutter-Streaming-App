import 'package:flutter/material.dart';
import 'package:streaming_app/presenter/pages/login/widgets/button_gradient_widget.dart';
import 'package:streaming_app/presenter/pages/login/widgets/checkbox_text_widget.dart';
import 'package:streaming_app/presenter/pages/login/widgets/text_form_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        const Text(
                          'Curta a viagem :)',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextFormFieldWidget(
                                  label: 'Usuário',
                                  validator: (s) => s,
                                ),
                                const SizedBox(height: 24),
                                TextFormFieldWidget(
                                  label: 'Senha',
                                  obscureText: true,
                                  validator: (s) => s,
                                ),
                              ],
                            ),
                          ),
                          CheckboxTextWidget(
                            text: 'Lembrar de mim',
                            onChanged: (_) {},
                          ),
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
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Não possui uma conta? ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  'Cadastre-se',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
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
