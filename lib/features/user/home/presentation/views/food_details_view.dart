import 'package:flutter/material.dart';
import 'package:yummy/features/user/home/data/data/user_food_model.dart';

import 'widgets/details/food_details_view_body.dart';

class FoodDetailsView extends StatelessWidget {
  static const String rn = '/foodDetailsView';
  final UserFoodModel model;
  const FoodDetailsView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FoodDetailsViewBody(userFoodModel: model),
    );
  }
}
