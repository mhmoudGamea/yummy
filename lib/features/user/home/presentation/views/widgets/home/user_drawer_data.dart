import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/config/app_colors.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../model_views/drawer_cubit.dart/drawer_cubit.dart';
import 'close_drawer.dart';
import 'user_drawer_avatar.dart';

class UserDrawerData extends StatelessWidget {
  const UserDrawerData({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerCubit = context.watch<DrawerCubit>();
    return SizedBox(
      width: double.infinity,
      height: 170,
      child: DrawerHeader(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
        ),
        padding:
            const EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 10),
        margin: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserDrawerAvatar(),
                CloseDrawer(),
              ],
            ),
            Text(
              drawerCubit.getUserModel?.name ?? 'unknown',
              style: Styles.title15.copyWith(color: Colors.white),
            ),
            Text(
              drawerCubit.getUserModel?.email! ?? 'unknown',
              style: Styles.title13.copyWith(color: AppColors.greyColor2),
            ),
          ],
        ),
      ),
    );
  }
}
