import 'package:flutter/material.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/widgets/c_item_rate.dart';
import '../../../../../../core/widgets/c_rounded_button.dart';
import '../../../data/models/favourite_model.dart';
import 'c_item_category.dart';
import 'c_item_image.dart';
import 'c_item_name.dart';

class CListViewItem extends StatelessWidget {
  final FavouriteModel model;
  const CListViewItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.6),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0.1, 0.1),
          ),
        ],
      ),
      child: Row(
        children: [
          CItemImage(image: model.foodImage),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CItemCategory(categoryName: model.category),
              const SizedBox(height: 2),
              CItemName(text: model.name),
              const SizedBox(height: 8),
              CItemRate(rate: model.rate, rateColor: Colors.black)
            ],
          ),
          const Spacer(),
          CRoundedButton(
            onTap: () {},
            icon: Icons.favorite_rounded,
            iconSize: 20,
            opacity: 0.13,
            color: secondaryColor,
          )
        ],
      ),
    );
  }
}
