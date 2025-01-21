import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../config/app_colors.dart';

class CShimmer extends StatelessWidget {
  final double height;
  final double width;
  const CShimmer({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor.withOpacity(0.1),
      highlightColor: AppColors.primaryColor.withOpacity(0.1),
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
  }
}
