import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/config/app_colors.dart';

class CIngrediant extends StatelessWidget {
  final List<dynamic> ingrediants;
  const CIngrediant({super.key, required this.ingrediants});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          itemBuilder: (context, index) => Container(
                width: 70,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.greyColor.withOpacity(0.2),
                ),
                child: CachedNetworkImage(
                  imageUrl: ingrediants[index],
                ),
              ),
          itemCount: ingrediants.length),
    );
  }
}
