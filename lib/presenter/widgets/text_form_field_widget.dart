import 'package:flutter/material.dart';
import 'package:streaming_app/presenter/widgets/form_field_widget.dart';

class TextFormFieldWidget extends FormFieldWidget {
  const TextFormFieldWidget({
    super.key,
    super.controller,
    required super.label,
    super.hintText,
    super.keyboardType,
    required super.validator,
  }) : super(obscureText: false);

  @override
  Widget? suffixIcon() => null;
}
