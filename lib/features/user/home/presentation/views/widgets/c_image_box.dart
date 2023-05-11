import 'package:flutter/material.dart';

class CImageBox extends StatelessWidget {
  final String imagePath;
  const CImageBox({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30, height: 30,
      // constraints: BoxConstraints(maxHeight: 30, maxWidth: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(imagePath),
          scale: 10,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
