import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/config/app_colors.dart';

class DrawerImage extends StatelessWidget {
  const DrawerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: const EdgeInsets.only(top: 30, left: 90, right: 90),
            width: double.infinity,
            height: 150,
            color: AppColors.primaryColor.withOpacity(0.5),
            child: Image.asset('assets/images/splash.png')),
        Positioned(
          top: 25,
          right: 0,
          child: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).closeDrawer();
              },
              icon: Icon(
                FontAwesomeIcons.xmark,
                color: AppColors.secondaryColor,
                size: 20,
              ),
            );
          }),
        ),
      ],
    );
  }
}
