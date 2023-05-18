import 'package:flutter/material.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/styles.dart';
import 'package:yummy/features/user/home/data/data/user_food_model.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/details/c_expanded_text.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/details/c_fixed_button.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/details/c_info.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/details/food_image.dart';

import '../c_header_name.dart';
import 'c_ingrediant.dart';

class FoodDetailsViewBody extends StatelessWidget {
  final UserFoodModel userFoodModel;
  const FoodDetailsViewBody({Key? key, required this.userFoodModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                FoodImage(image: userFoodModel.foodImage),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        userFoodModel.name,
                        style: Styles.title18
                            .copyWith(overflow: TextOverflow.fade),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 15),
                      CInfo(
                          rate: userFoodModel.rate,
                          calories: userFoodModel.calories,
                          prepareTime: userFoodModel.prepareTime),
                      const SizedBox(height: 20),
                      CExpandedText(text: userFoodModel.desc),
                      const SizedBox(height: 15),
                      const CHeaderName(name: 'Ingrediants'),
                      const SizedBox(height: 15),
                      CIngrediant(ingrediants: userFoodModel.ingrediants)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        CFixedButton(
            price: userFoodModel.price,
            icon: Icons.shopping_bag_rounded,
            bgColor: primaryColor,
            textColor: Colors.white,
            iconColor: Colors.white,
            text: 'Add To Cart'),
      ],
    );
  }
}
