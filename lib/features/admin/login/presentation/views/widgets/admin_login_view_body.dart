import 'package:flutter/material.dart';

import '../../../../../../core/config/app_colors.dart';
import 'admin_login_box.dart';

class AdminLoginViewBody extends StatelessWidget {
  const AdminLoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.5, 0.5],
        ),
      ),
      child: const AdminLoginBox(),
    );
  }
}
