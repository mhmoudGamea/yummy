import 'package:flutter/material.dart';

import '../../../../../../../core/utils/styles.dart';

class CIconButton extends StatelessWidget {
  final Color bgColor;
  final IconData icon;
  final Color iconColor;
  final String text;
  final Color textColor;
  const CIconButton(
      {Key? key,
      required this.bgColor,
      required this.icon,
      required this.iconColor,
      required this.text,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 22,
          ),
          const SizedBox(width: 15),
          Text(
            text,
            style: Styles.title15.copyWith(color: textColor),
          )
        ],
      ),
    );
  }
}
