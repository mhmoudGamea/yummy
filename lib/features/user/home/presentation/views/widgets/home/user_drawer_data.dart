import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../../core/config/app_colors.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../model_views/drawer_cubit.dart/drawer_cubit.dart';

class UserDrawerData extends StatelessWidget {
  const UserDrawerData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final drawerCubit = BlocProvider.of<DrawerCubit>(context);
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
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white),
                      image: DecorationImage(
                          image: NetworkImage(
                              drawerCubit.getUserModel.profileImage!),
                          fit: BoxFit.cover)),
                ),
                IconButton(
                    onPressed: () {
                      Scaffold.of(context).closeDrawer();
                    },
                    icon: Icon(FontAwesomeIcons.xmark, size: 21),
                    color: Colors.white),
              ],
            ),
            Text(
              drawerCubit.getUserModel.name!,
              style: Styles.title15.copyWith(color: Colors.white),
            ),
            Text(
              drawerCubit.getUserModel.email!,
              style: Styles.title13.copyWith(color: AppColors.greyColor2),
            ),
          ],
        ),
      ),
    );
  }
}
