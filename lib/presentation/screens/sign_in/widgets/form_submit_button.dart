import 'package:flutter/material.dart';

import '../../../shared_widgets/custom_elevated_button.dart';

class FormSubmitButton extends CustomElevatedButton {
  const FormSubmitButton({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
  }) : super(
          key: key,
          child: child,
          height: 55.0,
          onPressed: onPressed,
        );
}
