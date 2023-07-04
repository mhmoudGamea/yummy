import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/profile/presentation/model-views/profile_cubit/profile_cubit.dart';

import 'widgets/edit/user_edit_profile_view_body.dart';

class UserEditProfileView extends StatelessWidget {
  static const String rn = '/editProfile';
  const UserEditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: const Scaffold(
        body: SafeArea(
          child: UserEditProfileViewBody(),
        ),
      ),
    );
  }
}
