import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils/styles.dart';

class CRechText extends StatelessWidget {
  final String rich;
  final String text;
  final VoidCallback onPress;
  const CRechText(
      {super.key,
      required this.rich,
      required this.text,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: RichText(
        text: TextSpan(
          text: rich,
          style: Styles.title13.copyWith(color: AppColors.greyColor2),
          children: [
            TextSpan(
                text: text,
                style: Styles.title14.copyWith(color: AppColors.primaryColor)),
          ],
        ),
      ),
    );
  }
}
