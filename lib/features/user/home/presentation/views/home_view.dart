import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/home_repo_impl.dart';
import '../model_views/banner_cubit/banner_cubit.dart';
import '../model_views/home_cubit/home_cubit.dart';
import 'widgets/home/home_view_body.dart';

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
      ],
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
