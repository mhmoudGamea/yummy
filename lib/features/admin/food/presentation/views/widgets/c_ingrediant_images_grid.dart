import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/config/app_colors.dart';

class CIngrediantImagesGrid extends StatelessWidget {
  final List<File> ingrediantsImages;
  const CIngrediantImagesGrid({super.key, required this.ingrediantsImages});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 2.2 / 1.4, mainAxisSpacing: 5),
      itemBuilder: (context, index) {
        return ingrediantsImages.isEmpty
            ? Icon(
                FontAwesomeIcons.image,
                size: 50,
                color: AppColors.greyColor,
              )
            : Image.file(ingrediantsImages[index], width: 30, height: 30);
      },
      itemCount: ingrediantsImages.isEmpty ? 6 : ingrediantsImages.length,
    );
  }
}
