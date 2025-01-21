import 'package:flutter/material.dart';
import 'package:yummy/core/utils/styles.dart';

import '../../../../../../core/config/app_colors.dart';

class MoreInfoTab extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const MoreInfoTab(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(icon, size: 17, color: AppColors.primaryColor),
          ),
          const SizedBox(width: 15),
          Text(text, style: Styles.title15),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 17,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
