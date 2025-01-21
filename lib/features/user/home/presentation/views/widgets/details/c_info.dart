import 'package:flutter/material.dart';

import '../../../../../../../core/config/app_colors.dart';
import 'c_info_item.dart';

class CInfo extends StatelessWidget {
  final String rate;
  final String calories;
  final String prepareTime;
  const CInfo(
      {Key? key,
      required this.rate,
      required this.calories,
      required this.prepareTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CInfoItem(icon: Icons.star, iconColor: Colors.amber, text: rate),
        CInfoItem(
            icon: Icons.local_fire_department_rounded,
            iconColor: AppColors.secondaryColor,
            text: '$calories calories'),
        CInfoItem(
            icon: Icons.watch_later_sharp,
            iconColor: AppColors.babyBlue,
            text: '$prepareTime Min'),
      ],
    );
  }
}
