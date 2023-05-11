import 'package:flutter/material.dart';
import 'package:streaming_app/presenter/dialogs/info_dialog.dart';

class ErrorDialog extends InfoDialog {
  const ErrorDialog({
    super.key,
    required super.description,
    super.buttonText = 'Ok',
  }) : super(
          icon: Icons.error,
          iconColor: Colors.red,
        );
}
