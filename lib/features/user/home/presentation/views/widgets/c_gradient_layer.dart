import 'package:flutter/material.dart';

class CGradientLayer extends StatelessWidget {
  final double width;
  final double height;
  const CGradientLayer({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(colors: [
          Colors.black.withOpacity(0.6),
          Colors.transparent,
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      ),
    );
  }
}
