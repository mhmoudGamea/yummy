import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/services/user_service.dart';

import '../../data/repos/home_repo_impl.dart';
import '../model_views/banner_cubit/banner_cubit.dart';
import '../model_views/drawer_cubit.dart/drawer_cubit.dart';
import '../model_views/home_cubit/home_cubit.dart';
import 'widgets/home/home_view_body.dart';
import 'widgets/home/user_drawer.dart';

class HomeView extends StatelessWidget {
  static const String rn = '/homeView';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(HomeRepoImpl())..getUserData(context),
        ),
        BlocProvider(create: (context) => BannerCubit()),
        BlocProvider(
            create: (context) =>
                DrawerCubit(UserService())..getUserProfileData()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: UserDrawer(),
        body: SafeArea(
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
