import 'package:flutter/material.dart';
import 'package:yummy/features/user/home/data/data/user_food_model.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/details/food_image.dart';

class FoodDetailsViewBody extends StatelessWidget {
  final UserFoodModel userFoodModel;
  const FoodDetailsViewBody({Key? key, required this.userFoodModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FoodImage(image: userFoodModel.foodImage),
      ],
    );
  }
}
