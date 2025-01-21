import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/utils/helper.dart';
import '../model_views/cubit/category_cubit.dart';
import 'widgets/category_view_body.dart';

class CategoryView extends StatelessWidget {
  static const String rn = '/categoryView';
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: Scaffold(
        appBar: Helper.appBar(
          context: context,
          text: 'Categories',
          bgColor: AppColors.primaryColor,
        ),
        body: const SafeArea(
          child: CategoryViewBody(),
        ),
      ),
    );
  }
}
