import 'package:flutter/material.dart';

import '../../../custom_widgets/custom_text_form_field.dart';

// class SearchBarTextField extends CustomTextFormField {
// const SearchBarTextField({
//   Key? key,
//   required Widget prefixIcon,
//   required TextEditingController controller,
//   required void Function(String)? onChanged,
//   required String hintText,
// }) : super(
//           key: key,
//           borderRadius: 30.0,
//           controller: controller,
//           hintText: hintText,
//           onChanged: onChanged,
//           prefixIcon: prefixIcon,
//         );
// }

class SearchBarTextField extends StatelessWidget {
  const SearchBarTextField({
    Key? key,
    required this.prefixIcon,
    required this.controller,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);
  final Widget prefixIcon;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(1, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(
              30.0,
            ),
          ),
        ),
        CustomTextFormField(
          prefixIcon: prefixIcon,
          controller: controller,
          onChanged: onChanged,
          hintText: hintText,
          focusedBorder: InputBorder.none,
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
