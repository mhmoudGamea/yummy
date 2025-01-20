import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils/styles.dart';

class CErrorWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? bgColor;
  const CErrorWidget({
    super.key,
    required this.icon,
    required this.text,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor ?? secondaryColor.withAlpha((0.7 * 255).toInt()),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.white),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              text,
              style: Styles.title14.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
