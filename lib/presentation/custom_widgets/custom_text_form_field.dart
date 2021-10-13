import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final Color? cursorColor;
  final int? maxLines;
  final double? borderRadius;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? icon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final BorderSide? borderSide;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final InputBorder? focusedBorder;
  final bool obscureText;
  final bool enabled;
  final bool? autofocus;

  const CustomTextFormField({
    Key? key,
    this.style,
    this.textInputAction,
    this.cursorColor,
    this.maxLines,
    this.borderRadius = 30.0,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.errorText,
    this.prefixIcon,
    this.icon,
    this.suffixIcon,
    this.borderSide,
    this.keyboardType,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.validator,
    this.focusedBorder,
    this.obscureText = false,
    this.enabled = true,
    this.autofocus = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autofocus: autofocus!,
      cursorColor: cursorColor,
      controller: controller,
      style: style,
      maxLines: maxLines,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onSaved: onSaved,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        icon: icon,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18.0, horizontal: 15.0),
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
        enabled: enabled,
        focusedBorder: focusedBorder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius!),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius!),
          ),
          borderSide: borderSide ??
              BorderSide(color: Theme.of(context).backgroundColor),
        ),
      ),
      validator: validator,
    );
  }
}
