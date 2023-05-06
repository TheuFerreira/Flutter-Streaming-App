import 'package:flutter/material.dart';

abstract class FormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?) validator;
  final void Function(String)? onChanged;
  const FormFieldWidget({
    Key? key,
    this.controller,
    required this.label,
    this.hintText = 'Digite aqui',
    this.obscureText = false,
    this.keyboardType,
    required this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        cursorColor: const Color(0xFFB6B6B6),
        keyboardType: keyboardType,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 18,
          ),
          errorStyle: const TextStyle(
            color: Color(0xFFFF6262),
          ),
          suffixIcon: suffixIcon(),
          labelText: label,
          labelStyle: Theme.of(context).textTheme.labelLarge,
          floatingLabelStyle: Theme.of(context).textTheme.labelLarge,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFFA8A8A8),
            fontSize: 14,
            fontWeight: FontWeight.w200,
          ),
          enabledBorder: _border(),
          focusedBorder: _border(),
          errorBorder: _errorBorder(),
          border: _border(),
        ),
      ),
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Color(0xFFB6B6B6),
      ),
    );
  }

  OutlineInputBorder _errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Color(0xFFFF6262),
      ),
    );
  }

  Widget? suffixIcon();
}
