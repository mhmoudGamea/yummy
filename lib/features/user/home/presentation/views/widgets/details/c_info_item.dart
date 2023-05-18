import 'package:flutter/material.dart';

import '../../../../../../../core/constants.dart';
import '../../../../../../../core/utils/styles.dart';

class CInfoItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  const CInfoItem(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 7, bottom: 7, left: 15, right: 15),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(icon, size: 19, color: iconColor),
          const SizedBox(width: 5),
          Text(text, style: Styles.title14)
        ],
      ),
    );
  }
}
