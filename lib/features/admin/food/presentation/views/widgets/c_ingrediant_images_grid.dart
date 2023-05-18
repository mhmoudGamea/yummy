import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/constants.dart';

class CIngrediantImagesGrid extends StatelessWidget {
  final List<File> ingrediantsImages;
  const CIngrediantImagesGrid({Key? key, required this.ingrediantsImages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 2.2 / 1.4, mainAxisSpacing: 5),
      itemBuilder: (context, index) {
        return ingrediantsImages.isEmpty
            ? const Icon(
                FontAwesomeIcons.image,
                size: 50,
                color: greyColor,
              )
            : Image.file(ingrediantsImages[index], width: 30, height: 30);
      },
      itemCount: ingrediantsImages.isEmpty ? 6 : ingrediantsImages.length,
    );
  }
}
