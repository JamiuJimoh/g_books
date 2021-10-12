import 'package:flutter/material.dart';
import 'package:g_books/presentation/custom_widgets/custom_elevated_button.dart';

class FormSubmitButton extends CustomElevatedButton {
  const FormSubmitButton({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
  }) : super(
          key: key,
          child: child,
          height: 55.0,
          // buttonColor:

          onPressed: onPressed,
        );
}
