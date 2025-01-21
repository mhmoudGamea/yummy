import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CCircleLoading extends StatelessWidget {
  const CCircleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CircularProgressIndicator(
          color: AppColors.primaryColor,
          strokeWidth: 3,
          backgroundColor: AppColors.greyColor),
    );
  }
}
