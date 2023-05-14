import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/helper.dart';
import 'package:yummy/features/admin/food/presentation/model_views/food_cubit/food_cubit.dart';

import 'widgets/food_view_body.dart';

class FoodView extends StatelessWidget {
  static const String rn = '/foodView';
  const FoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit(),
      child: Scaffold(
        appBar: Helper.appBar(
            context: context, text: 'Food', bgColor: primaryColor),
        body: const SafeArea(
          child: FoodViewBody(),
        ),
      ),
    );
  }
}
