import 'package:flutter/material.dart';

import '../../../../../../core/config/app_colors.dart';
import 'admin_register_box.dart';

class AdminRegisterViewBody extends StatelessWidget {
  const AdminRegisterViewBody({super.key});

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
          stops: [0.5, 0.5],
        ),
      ),
      child: const AdminRegisterBox(),
    );
  }
}
