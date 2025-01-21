import 'package:flutter/material.dart';
import 'package:yummy/core/utils/styles.dart';

import '../../../../../../core/config/app_colors.dart';

class CItemCategory extends StatelessWidget {
  final String categoryName;
  const CItemCategory({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/categories/$categoryName.png',
            width: 25, height: 25),
        const SizedBox(width: 8),
        Text(
          categoryName,
          style: Styles.title14.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
