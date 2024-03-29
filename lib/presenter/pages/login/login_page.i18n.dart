import 'package:i18n_extension/i18n_extension.dart';

const email = 'email';
const typeHere = 'typeHere';
const password = 'password';
const register = 'register';
const login = 'login';
const rememberMe = 'rememberMe';
const fieldRequired = 'fieldRequired';
const forgotPassword = 'forgotPassword';
const notHaveAccount = 'notHaveAccount';
const enjoyJourney = 'enjoyJourney';
const spaceFilms = 'SpaceFilms';
const invalidEmail = 'invalidEmail';

extension Localization on String {
  static const _t = Translations.from('en_us', {
    email: {
      'en_us': 'Email',
      'pt_br': 'E-mail',
    },
    typeHere: {
      'en_us': 'Type here',
      'pt_br': 'Digite aqui',
    },
    password: {
      'en_us': 'Password',
      'pt_br': 'Senha',
    },
    register: {
      'en_us': 'Register',
      'pt_br': 'Cadastre-se',
    },
    login: {
      'en_us': 'Login',
      'pt_br': 'Entrar',
    },
    rememberMe: {
      'en_us': 'Remember Me',
      'pt_br': 'Lembrar de mim',
    },
    fieldRequired: {
      'en_us': 'Field not completed',
      'pt_br': 'Campo não preenchido',
    },
    forgotPassword: {
      'en_us': 'Forgot yout password?',
      'pt_br': 'Esqueceu sua senha?',
    },
    notHaveAccount: {
      'en_us': 'Don\'t have account? ',
      'pt_br': 'Não possui uma conta? ',
    },
    enjoyJourney: {
      'en_us': 'Enjoy the journey :)',
      'pt_br': 'Curta a viagem :)',
    },
    spaceFilms: {
      'en_us': 'SpaceFilms',
      'pt_br': 'SpaceFilms',
    },
    invalidEmail: {
      'en_us': 'Invalid email',
      'pt_br': 'E-mail inválido',
    },
  });

  String get i18n => localize(this, _t);
}
