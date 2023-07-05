import 'package:flutter/material.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/styles.dart';

class UserProfileSubInfo extends StatelessWidget {
  const UserProfileSubInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          userProfileInfoItem(
              'Order Food', greyColor2, null, '120', primaryColor, null),
          userProfileInfoItem(
              'Spending', greyColor2, null, '\$ 4120', primaryColor, null),
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
