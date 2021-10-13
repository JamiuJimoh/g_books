import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    this.width = 125.0,
    this.height,
    required this.thumbnail,
  }) : super(key: key);
  final String thumbnail;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        image: DecorationImage(
          image: NetworkImage(thumbnail),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
