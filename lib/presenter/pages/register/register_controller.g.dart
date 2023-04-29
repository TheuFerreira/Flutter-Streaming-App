// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on RegisterControllerBase, Store {
  Computed<bool>? _$showStrengthComputed;

  @override
  bool get showStrength =>
      (_$showStrengthComputed ??= Computed<bool>(() => super.showStrength,
              name: 'RegisterControllerBase.showStrength'))
          .value;

  late final _$hidePasswordAtom =
      Atom(name: 'RegisterControllerBase.hidePassword', context: context);

  @override
  bool get hidePassword {
    _$hidePasswordAtom.reportRead();
    return super.hidePassword;
  }

  @override
  set hidePassword(bool value) {
    _$hidePasswordAtom.reportWrite(value, super.hidePassword, () {
      super.hidePassword = value;
    });
  }

  late final _$strengthAtom =
      Atom(name: 'RegisterControllerBase.strength', context: context);

  @override
  int get strength {
    _$strengthAtom.reportRead();
    return super.strength;
  }

  @override
  set strength(int value) {
    _$strengthAtom.reportWrite(value, super.strength, () {
      super.strength = value;
    });
  }

  late final _$hideRepeatPasswordAtom =
      Atom(name: 'RegisterControllerBase.hideRepeatPassword', context: context);

  @override
  bool get hideRepeatPassword {
    _$hideRepeatPasswordAtom.reportRead();
    return super.hideRepeatPassword;
  }

  @override
  set hideRepeatPassword(bool value) {
    _$hideRepeatPasswordAtom.reportWrite(value, super.hideRepeatPassword, () {
      super.hideRepeatPassword = value;
    });
  }

  late final _$rememberMeAtom =
      Atom(name: 'RegisterControllerBase.rememberMe', context: context);

  @override
  bool get rememberMe {
    _$rememberMeAtom.reportRead();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.reportWrite(value, super.rememberMe, () {
      super.rememberMe = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('RegisterControllerBase.login', context: context);

  @override
  Future<void> login(BuildContext context) {
    return _$loginAsyncAction.run(() => super.login(context));
  }

  late final _$RegisterControllerBaseActionController =
      ActionController(name: 'RegisterControllerBase', context: context);

  @override
  void changeHidePassword(bool value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.changeHidePassword');
    try {
      return super.changeHidePassword(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPasswordChange(String value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.onPasswordChange');
    try {
      return super.onPasswordChange(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeHideRepeatPassword(bool value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.changeHideRepeatPassword');
    try {
      return super.changeHideRepeatPassword(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRememberMe(bool value) {
    final _$actionInfo = _$RegisterControllerBaseActionController.startAction(
        name: 'RegisterControllerBase.setRememberMe');
    try {
      return super.setRememberMe(value);
    } finally {
      _$RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hidePassword: ${hidePassword},
strength: ${strength},
hideRepeatPassword: ${hideRepeatPassword},
rememberMe: ${rememberMe},
showStrength: ${showStrength}
    ''';
  }
}
