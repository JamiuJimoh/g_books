import 'package:flutter/material.dart';

class ImageContainer extends StatefulWidget {
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
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  var _error = false;
  @override
  Widget build(BuildContext context) {
    print(_error);
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        color: Colors.blueGrey,
        image: DecorationImage(
          image: NetworkImage(widget.thumbnail),
          fit: BoxFit.fill,
          onError: (_, __) => setState(() {
            _error = true;
          }),
        ),
      ),
      child: _error
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                    child: Text(
                  'No Image',
                  style: TextStyle(fontSize: 18.0, color: Colors.black38),
                )),
              ],
            )
          : null,
    );
  }
}
