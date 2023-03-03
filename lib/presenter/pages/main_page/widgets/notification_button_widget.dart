import 'package:flutter/material.dart';

class NotificationButtonWidget extends StatelessWidget {
  final bool hasNotifications;
  final Color normalColor;
  final Color notificationColor;
  final void Function() onTap;
  const NotificationButtonWidget({
    Key? key,
    this.hasNotifications = false,
    required this.normalColor,
    required this.notificationColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: hasNotifications ? notificationColor : normalColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
            ),
          ),
          Visibility(
            visible: hasNotifications,
            child: Positioned(
              top: 1,
              right: 1,
              child: ClipOval(
                child: Container(
                  width: 12,
                  height: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
