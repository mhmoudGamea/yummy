import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yummy/core/constants.dart';

class CShimmer extends StatelessWidget {
  final double height;
  final double width;
  const CShimmer({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: greyColor.withOpacity(0.1),
      highlightColor: primaryColor.withOpacity(0.1),
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
