import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils/styles.dart';

class CErrorWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  Color? bgColor;
  CErrorWidget({
    Key? key,
    required this.icon,
    required this.text,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor ?? secondaryColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.white),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              'Sorry we have no banners for now for you.',
              style: Styles.title14.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
