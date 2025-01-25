import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CCircleLoading extends StatelessWidget {
  final Color color;
  const CCircleLoading({super.key, this.color = const Color(0xfff9a825)});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CircularProgressIndicator(
          color: color, strokeWidth: 3, backgroundColor: AppColors.greyColor),
    );
  }
}
