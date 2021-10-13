import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/blank-profile-picture.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
