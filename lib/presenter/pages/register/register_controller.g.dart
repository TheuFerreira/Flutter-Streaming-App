// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterController on RegisterControllerBase, Store {
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
rememberMe: ${rememberMe}
    ''';
  }
}
