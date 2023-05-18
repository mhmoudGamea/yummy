import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yummy/core/widgets/c_item_rate.dart';
import 'package:yummy/core/widgets/text_13.dart';

import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/c_shimmer.dart';
import '../../../data/models/admin_food_model.dart';

class CGridItem extends StatelessWidget {
  final AdminFoodModel adminFoodModel;
  const CGridItem({Key? key, required this.adminFoodModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 180,
          height: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: adminFoodModel.foodImage,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const CShimmer(height: 260, width: 180),
            ),
          ),
        ),
        Container(
          width: 180,
          height: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Colors.black.withOpacity(0.6),
              Colors.transparent,
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
        ),
        Positioned(
          top: 15,
          left: 12,
          child: Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.4),
              gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0.8),
                Colors.transparent,
              ], begin: Alignment.bottomCenter, end: Alignment.topRight),
            ),
            child: Row(
              children: [
                Image.asset(
                    'assets/images/categories/${adminFoodModel.category}.png',
                    width: 25,
                    height: 25),
                const SizedBox(width: 4),
                Text13(text: adminFoodModel.category, color: Colors.white)
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 12,
          child: SizedBox(
            width: 120,
            child: Text(
              adminFoodModel.name,
              style: Styles.title16
                  .copyWith(color: Colors.white, overflow: TextOverflow.fade),
              maxLines: 3,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 12,
          child: SizedBox(
            width: 120,
            child: Row(
              children: [
                Text13(
                    text: '${adminFoodModel.prepareTime} Min',
                    color: Colors.white),
                const SizedBox(width: 4),
                const Text13(text: '|', color: Colors.white),
                const SizedBox(width: 4),
                CItemRate(rate: adminFoodModel.rate, rateColor: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
