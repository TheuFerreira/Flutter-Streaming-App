import 'package:i18n_extension/i18n_extension.dart';

const confirmEmail = 'confirmEmail';
const exit = 'exit';
const sent = 'sent';
const emailResetPassword = 'emailResetPassword';
const invalidEmail = 'invalidEmail';
const notConfirmedEmail = 'notConfirmedEmail';
const invalidEmailOrPassword = 'invalidEmailOrPassword';
const ok = 'ok';
const internalError = 'internalError';
const tryAgain = 'tryAgain';

extension Localization on String {
  static const _t = Translations.from('en_us', {
    confirmEmail: {
      'en_us': 'Confirm your email to\nsend the password reset:',
      'pt_br': 'Confirme seu e-mail para o\nenvio da redefinição de senha:',
    },
    exit: {
      'en_us': 'Exit',
      'pt_br': 'Sair',
    },
    sent: {
      'en_us': 'Sent',
      'pt_br': 'Enviar',
    },
    emailResetPassword: {
      'en_us': 'A link to reset\nyour password has been sent\nto your email!',
      'pt_br':
          'Um link para redefinição\nde senha foi enviado para\nseu e-mail!',
    },
    invalidEmail: {
      'en_us': 'Wrong email,\nplease re-enter!',
      'pt_br': 'E-mail incorreto, por favor\ndigite novamente!',
    },
    notConfirmedEmail: {
      'en_us': 'You haven\'t confirmed\nyour email yet!',
      'pt_br': 'Você ainda não\nconfirmou seu e-mail!',
    },
    invalidEmailOrPassword: {
      'en_us': 'Incorrect email\nor password!',
      'pt_br': 'E-mail ou senha\nincorretos!',
    },
    ok: {
      'en_us': 'Ok',
      'pt_br': 'Ok',
    },
    internalError: {
      'en_us': 'An internal error occurred,\nplease try again!',
      'pt_br': 'Ocorreu um erro interno,\ntente novamente!',
    },
    tryAgain: {
      'en_us': 'Try Again',
      'pt_br': 'Tentar novamente',
    },
  });

  String get i18n => localize(this, _t);
}
