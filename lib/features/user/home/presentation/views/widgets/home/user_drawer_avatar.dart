import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yummy/features/user/home/presentation/model_views/drawer_cubit.dart/drawer_state.dart';

import '../../../model_views/drawer_cubit.dart/drawer_cubit.dart';

class UserDrawerAvatar extends StatelessWidget {
  const UserDrawerAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerCubit = BlocProvider.of<DrawerCubit>(context);
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        return Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.white),
          ),
          child: (drawerCubit.getUserModel == null ||
                  drawerCubit.getUserModel!.profileImage!.isEmpty)
              ? Icon(
                  FontAwesomeIcons.user,
                  size: 25,
                  color: Color(0xFFF4F6F8),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    drawerCubit.getUserModel!.profileImage!,
                    fit: BoxFit.cover,
                  ),
                ),
        );
      },
    );
  }
}
