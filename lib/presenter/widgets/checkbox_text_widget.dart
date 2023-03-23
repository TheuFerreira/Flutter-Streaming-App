import 'package:flutter/material.dart';
import 'package:streaming_app/presenter/widgets/checkbox_widget.dart';

class CheckboxTextWidget extends StatelessWidget {
  final bool active;
  final String text;
  final void Function(bool) onChanged;
  const CheckboxTextWidget({
    Key? key,
    this.active = false,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        onTap: () => onChanged(!active),
        child: Row(
          children: [
            CheckboxWidget(
              active: active,
              normalColor: const Color(0xFF484848),
              activeColor: const Color(0xFF967BE3),
              onChanged: onChanged,
            ),
            const SizedBox(width: 12),
            InkWell(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
