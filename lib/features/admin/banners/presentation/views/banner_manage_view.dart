import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/constants.dart';

import '../../../../../core/utils/helper.dart';
import '../model_views/banner_cubit/banner_cubit.dart';
import 'widgets/banner_manage_view_body.dart';

class BannerManageView extends StatelessWidget {
  static const String rn = '/bannerManageView';
  const BannerManageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BannerCubit()..getBanners(),
      child: Scaffold(
        appBar: Helper.appBar(
          context: context,
          text: 'Banners',
          bgColor: primaryColor,
        ),
        body: const SafeArea(
          child: BannerManageViewBody(),
        ),
      ),
    );
  }
}
