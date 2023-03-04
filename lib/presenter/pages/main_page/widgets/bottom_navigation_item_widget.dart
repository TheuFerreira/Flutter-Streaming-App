import 'package:flutter/material.dart';

class BottomNavigationItemWidget extends StatelessWidget {
  final IconData icon;
  final void Function() onTap;
  const BottomNavigationItemWidget({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: const Color(0xFF967BE3),
        size: 28,
      ),
    );
  }
}
