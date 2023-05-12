import 'package:i18n_extension/i18n_extension.dart';

const cancelRegister = 'cancelRegister';
const no = 'no';
const yes = 'yes';
const fieldRequired = 'fieldRequired';
const minChars = 'minChars';
const specialCharacter = 'specialCharacter';
const maxChars = 'maxChars';
const chooseAnotherUser = 'chooseAnotherUser';
const unknownError = 'unknownError';
const chooseAnotherEmail = 'chooseAnotherEmail';

extension Localization on String {
  static const _t = Translations.from('en_us', {
    cancelRegister: {
      'en_us': 'Do you want to cancel\nthe registration process?',
      'pt_br': 'Deseja cancelar o processo\nde cadastro?',
    },
    no: {
      'en_us': 'No',
      'pt_br': 'Não',
    },
    yes: {
      'en_us': 'Yes',
      'pt_br': 'Sim',
    },
    fieldRequired: {
      'en_us': 'Field not completed',
      'pt_br': 'Campo não preenchido',
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
    chooseAnotherUser: {
      'en_us': 'Choose another user',
      'pt_br': 'Escolha outro usuário',
    },
    unknownError: {
      'en_us': 'An unknown problem occurred',
      'pt_br': 'Ocorreu um problema desconhecido',
    },
    chooseAnotherEmail: {
      'en_us': 'Choose another email',
      'pt_br': 'Escolha outro E-mail',
    },
  });

  String get i18n => localize(this, _t);
}
