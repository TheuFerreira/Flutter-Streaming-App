import 'package:flutter/material.dart';
import 'package:streaming_app/presenter/widgets/form_field_widget.dart';

class PasswordFormFieldWidget extends FormFieldWidget {
  final void Function(bool) onChangeObscureText;
  const PasswordFormFieldWidget({
    super.key,
    super.controller,
    required super.label,
    super.keyboardType,
    required super.validator,
    required super.obscureText,
    required this.onChangeObscureText,
  });

  @override
  Widget? suffixIcon() {
    final icon =
        obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    return IconButton(
      onPressed: () => onChangeObscureText(obscureText),
      icon: Icon(icon),
      color: const Color(0xFFD7D7D7),
    );
  }
}
