import 'package:flutter/material.dart';

class LoadingDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (builder) {
        return const _LoadingDialog();
      },
    );
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(
          height: 48,
          width: 48,
          child: CircularProgressIndicator(
            backgroundColor: Color(0xFFD9D9D9),
            color: Color(0xFF967BE3),
          ),
        ),
      ],
    );
  }
}
