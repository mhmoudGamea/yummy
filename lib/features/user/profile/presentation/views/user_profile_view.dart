import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/services/user_service.dart';

import '../../domain/repos/profile_repo_impl.dart';
import '../model-views/profile_cubit/profile_cubit.dart';
import 'widgets/user_profile_view_body.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(ProfileRepoImpl(), UserService())..getUserProfileData(),
      child: const Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(child: UserProfileViewBody())),
    );
  }
}
