import 'package:flutter/material.dart';
import 'package:yummy/features/user/search/data/models/search_model.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/c_food_image_box.dart';
import '../../../../home/presentation/views/widgets/c_gradient_layer.dart';

class CPopularFoodListItem extends StatelessWidget {
  final SearchModel model;
  const CPopularFoodListItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CFoodImageBox(image: model.foodImage, width: 150, height: 210),
        const CGradientLayer(width: 150, height: 210),
        Positioned(
          bottom: 10,
          left: 12,
          child: SizedBox(
            width: 120,
            child: Text(
              model.name,
              style: Styles.title15.copyWith(
                  color: Colors.white, overflow: TextOverflow.ellipsis),
              maxLines: 3,
            ),
          ),
        ),
      ],
    );
  }
}
