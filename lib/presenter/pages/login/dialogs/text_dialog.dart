import 'package:flutter/material.dart';
import 'package:streaming_app/presenter/widgets/text_form_field_widget.dart';
import 'package:validatorless/validatorless.dart';

class TextDialog extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;
  final Color iconColor;
  final String description;
  final String cancelButtonText;
  final String okButtonText;
  final void Function() onOkButton;
  const TextDialog({
    Key? key,
    required this.controller,
    required this.icon,
    this.iconColor = Colors.white,
    required this.description,
    required this.cancelButtonText,
    required this.okButtonText,
    required this.onOkButton,
  }) : super(key: key);

  @override
  State<TextDialog> createState() => _TextDialogState();
}

class _TextDialogState extends State<TextDialog> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF222222),
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Color(0xDE777777),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 24,
            ),
            child: Column(
              children: [
                Icon(
                  widget.icon,
                  size: 40,
                  color: widget.iconColor,
                ),
                const SizedBox(height: 12),
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKey,
                  child: TextFormFieldWidget(
                    controller: widget.controller,
                    label: 'E-mail',
                    keyboardType: TextInputType.emailAddress,
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo não preenchido'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: Navigator.of(context).pop,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(20),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    textStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  child: Text(
                    widget.cancelButtonText,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    widget.onOkButton();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF684DB5),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(20),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    textStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  child: Text(
                    widget.okButtonText,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
