import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data/user_food_model.dart';
import '../model_views/cart_cubit/cart_cubit.dart';
import 'widgets/details/food_details_view_body.dart';

class FoodDetailsView extends StatelessWidget {
  static const String rn = '/foodDetailsView';
  final UserFoodModel model;
  const FoodDetailsView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        body: FoodDetailsViewBody(userFoodModel: model),
      ),
    );
  }
}
