import 'package:flutter/material.dart';

import '../../../../../../core/constants.dart';
import 'admin_login_box.dart';

class AdminLoginViewBody extends StatelessWidget {
  const AdminLoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5],
        ),
      ),
      child: const AdminLoginBox(),
    );
  }
}
