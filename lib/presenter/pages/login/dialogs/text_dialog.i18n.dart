import 'package:i18n_extension/i18n_extension.dart';

const email = 'email';
const typeHere = 'typeHere';
const fieldRequired = 'fieldRequired';
const emailInvalid = 'emailInvalid';

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
    fieldRequired: {
      'en_us': 'Field not completed',
      'pt_br': 'Campo não preenchido',
    },
    emailInvalid: {
      'en_us': 'Invalid email',
      'pt_br': 'E-mail inválido',
    },
  });

  String get i18n => localize(this, _t);
}
