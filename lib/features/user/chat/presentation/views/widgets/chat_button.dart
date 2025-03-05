import 'package:flutter/material.dart';

import '../../../../../../core/config/app_colors.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({super.key, required this.onTapped, required this.icon});
  final VoidCallback onTapped;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        height: 50,
        width: 40,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 18, color: Colors.white),
      ),
    );
  }
}
