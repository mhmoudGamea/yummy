import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/welcome/data/repos/location/location_repo_impl.dart';
import 'package:yummy/features/welcome/presentation/model_views/location_cubit/location_cubit.dart';

import '../../data/repos/home_repo_impl.dart';
import '../model_views/banner_cubit/banner_cubit.dart';
import '../model_views/home_cubit/home_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const String rn = '/homeView';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return HomeCubit(HomeRepoImpl())..getUserData(context);
          },
        ),
        BlocProvider(
          create: (context) {
            return BannerCubit();
          },
        ),
        BlocProvider(
          create: (context) => LocationCubit(LocationRepoImpl()),
        ),
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
