import 'package:flutter/material.dart';

import '../../../../../../core/constants.dart';

class CRoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? color;
  final double? iconSize;
  final double? opacity;
  const CRoundedButton(
      {Key? key,
      required this.onTap,
      required this.icon,
      this.color,
      this.opacity,
      this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 40,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.withOpacity(0.4),
          gradient: LinearGradient(colors: [
            Colors.black.withOpacity(opacity ?? 0.8),
            Colors.transparent,
          ], begin: Alignment.bottomCenter, end: Alignment.topRight),
        ),
        child: Icon(
          icon,
          color: color ?? greyColor,
          size: iconSize ?? 21,
        ),
      ),
    );
  }
}
