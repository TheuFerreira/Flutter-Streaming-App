import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final Image photo;
  final String username;
  const UserInfoWidget({
    Key? key,
    required this.username,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Container(
            height: 55,
            width: 55,
            color: Colors.red,
            child: photo,
          ),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Olá',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '$username!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
