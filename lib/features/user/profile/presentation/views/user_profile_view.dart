import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model-views/profile_cubit/profile_cubit.dart';
import 'widgets/user_profile_view_body.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: const Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(child: UserProfileViewBody())),
    );
  }
}
