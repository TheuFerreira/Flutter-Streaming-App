import 'package:i18n_extension/i18n_extension.dart';

const enjoyJourney = 'enjoyJourney';
const spaceFilms = 'SpaceFilms';
const createAccount = 'createAccount';
const userName = 'userName';
const typeHere = 'typeHere';
const fieldRequired = 'fieldRequired';
const password = 'password';
const minChars = 'minChars';
const specialCharacter = 'specialCharacter';
const maxChars = 'maxChars';
const weak = 'weak';
const average = 'average';
const strong = 'strong';
const repeatPassword = 'repeatPassword';
const passwordsNotMatch = 'passwordsNotMatch';
const email = 'email';
const invalidEmail = 'invalidEmail';
const rememberMe = 'rememberMe';
const enter = 'enter';

extension Localization on String {
  static const _t = Translations.from('en_us', {
    enjoyJourney: {
      'en_us': 'Enjoy the journey :)',
      'pt_br': 'Curta a viagem :)',
    },
    spaceFilms: {
      'en_us': 'SpaceFilms',
      'pt_br': 'SpaceFilms',
    },
    createAccount: {
      'en_us': 'Create account:',
      'pt_br': 'Criar conta:',
    },
    userName: {
      'en_us': 'Username',
      'pt_br': 'Nome de usuário',
    },
    typeHere: {
      'en_us': 'Type here',
      'pt_br': 'Digite aqui',
    },
    fieldRequired: {
      'en_us': 'Field not completed',
      'pt_br': 'Campo não preenchido',
    },
    password: {
      'en_us': 'Password',
      'pt_br': 'Senha',
    },
    minChars: {
      'en_us': 'At least 8 characters',
      'pt_br': 'Pelo menos 8 caracteres',
    },
    specialCharacter: {
      'en_us': 'At least 1 special character',
      'pt_br': 'Pelo menos 1 caractere especial',
    },
    maxChars: {
      'en_us': 'Maximum 16 characters',
      'pt_br': 'Máximo de 16 caracteres',
    },
    weak: {
      'en_us': 'Weak',
      'pt_br': 'Fraca',
    },
    average: {
      'en_us': 'Average',
      'pt_br': 'Média',
    },
    strong: {
      'en_us': 'Strong',
      'pt_br': 'Forte',
    },
    repeatPassword: {
      'en_us': 'Repeat your password',
      'pt_br': 'Repita sua senha',
    },
    passwordsNotMatch: {
      'en_us': 'Passwords do not match',
      'pt_br': 'As senhas não coincidem',
    },
    email: {
      'en_us': 'Email',
      'pt_br': 'E-mail',
    },
    invalidEmail: {
      'en_us': 'Invalid email',
      'pt_br': 'E-mail inválido',
    },
    rememberMe: {
      'en_us': 'Do you remember me',
      'pt_br': 'Lembrar de mim',
    },
    enter: {
      'en_us': 'Enter',
      'pt_br': 'Entrar',
    },
  });

  String get i18n => localize(this, _t);
}
