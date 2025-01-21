import 'package:flutter/material.dart';
import 'package:yummy/core/utils/styles.dart';

import '../../../../../../core/config/app_colors.dart';

class UserProfileSubInfo extends StatelessWidget {
  const UserProfileSubInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          userProfileInfoItem('Order Food', AppColors.greyColor2, null, '120',
              AppColors.primaryColor, null),
          userProfileInfoItem('Spending', AppColors.greyColor2, null, '\$ 4120',
              AppColors.primaryColor, null),
        ],
      ),
    );
  }
}

Widget userProfileInfoItem(String title, Color titleColor, double? titleSize,
    String subtitle, Color subtitleColor, double? subtitleSize) {
  return Column(
    children: [
      Text(
        title,
        style: Styles.title15
            .copyWith(color: titleColor, fontSize: titleSize ?? 13),
      ),
      const SizedBox(height: 10),
      Text(
        subtitle,
        style: Styles.title15
            .copyWith(color: subtitleColor, fontSize: subtitleSize ?? 16),
      ),
    ],
  );
}
