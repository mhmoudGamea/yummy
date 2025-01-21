import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/utils/helper.dart';
import '../model_views/banner_cubit/banner_cubit.dart';
import 'widgets/banner_manage_view_body.dart';

class BannerManageView extends StatelessWidget {
  static const String rn = '/bannerManageView';
  const BannerManageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BannerCubit(),
      child: Scaffold(
        appBar: Helper.appBar(
          context: context,
          text: 'Banners',
          bgColor: AppColors.primaryColor,
        ),
        body: const SafeArea(
          child: BannerManageViewBody(),
        ),
      ),
    );
  }
}
