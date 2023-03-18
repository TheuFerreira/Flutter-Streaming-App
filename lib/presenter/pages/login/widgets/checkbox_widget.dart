import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  final bool active;
  final Color activeColor;
  final Color normalColor;
  final void Function(bool) onChanged;
  const CheckboxWidget({
    Key? key,
    this.active = false,
    required this.normalColor,
    required this.activeColor,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onChanged(!widget.active),
      child: AnimatedContainer(
        height: 20,
        width: 20,
        duration: const Duration(milliseconds: 250),
        curve: Curves.bounceIn,
        decoration: BoxDecoration(
          color: widget.active ? widget.activeColor : widget.normalColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Visibility(
          visible: widget.active,
          child: const Icon(
            Icons.check,
            size: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
