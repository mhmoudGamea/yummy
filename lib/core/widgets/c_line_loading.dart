import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CLineLoading extends StatelessWidget {
  const CLineLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: LinearProgressIndicator(
          color: AppColors.primaryColor,
          minHeight: 3,
          backgroundColor: AppColors.greyColor),
    );
  }
}
