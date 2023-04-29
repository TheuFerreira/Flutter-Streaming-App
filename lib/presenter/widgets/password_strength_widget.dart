import 'package:flutter/material.dart';

class PasswordStrengthWidget extends StatelessWidget {
  final Color baseColor;
  final List<PasswordStrength> strengths;
  final int fill;
  const PasswordStrengthWidget({
    Key? key,
    required this.baseColor,
    required this.strengths,
    this.fill = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ...strengths.map((e) {
              final index = strengths.indexOf(e);
              final totalItems = strengths.length - 1;
              Color color = baseColor;
              if (fill > index) {
                color = strengths[fill - 1].color;
              }

              final showMargin = index < totalItems;

              return _bar(color, showMargin);
            }),
          ],
        ),
        _text(),
      ],
    );
  }

  Widget _bar(Color color, bool showMargin) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 3,
              color: color,
            ),
          ),
          if (showMargin) const SizedBox(width: 4),
        ],
      ),
    );
  }

  Widget _text() {
    if (fill <= 0) {
      return Container();
    }

    final fillAdjusted = fill - 1;
    final strength = strengths[fillAdjusted];

    return Text(
      strength.text,
      style: TextStyle(
        fontWeight: FontWeight.w200,
        fontSize: 12,
        color: strength.color,
      ),
    );
  }
}

class PasswordStrength {
  final String text;
  final Color color;

  const PasswordStrength({
    required this.text,
    required this.color,
  });
}
