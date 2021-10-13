import 'package:flutter/material.dart';
import 'package:g_books/presentation/custom_widgets/custom_text_form_field.dart';

class SignInTextField extends CustomTextFormField {
  const SignInTextField({
    Key? key,
    required Widget prefixIcon,
    required String labelText,
    required TextEditingController controller,
    required String? errorText,
    required void Function(String)? onChanged,
    Widget? suffixIcon,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    bool enabled = true,
    bool obscureText = false,
    int? maxLines = 1,
  }) : super(
          key: key,
          borderRadius: 30.0,
          controller: controller,
          errorText: errorText,
          enabled: enabled,
          onChanged: onChanged,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: labelText,
          obscureText: obscureText,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          maxLines: maxLines,
        );
}
