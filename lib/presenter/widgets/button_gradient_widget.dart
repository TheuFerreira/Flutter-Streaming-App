import 'package:flutter/material.dart';

class ButtonGradientWidget extends StatelessWidget {
  final LinearGradient gradient;
  final Widget child;
  final void Function() onPressed;
  const ButtonGradientWidget({
    Key? key,
    required this.gradient,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
