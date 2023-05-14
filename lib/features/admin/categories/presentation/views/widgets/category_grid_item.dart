import 'package:flutter/material.dart';
import 'package:yummy/features/admin/categories/data/models/category_model.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/utils/styles.dart';

class CategoryGridItem extends StatelessWidget {
  final CategoryModel model;
  const CategoryGridItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 180,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(width: 2, color: greyColor),
      ),
      child: Column(
        children: [
          Image.network(
            model.image,
            height: 110,
            width: 100,
          ),
          const Divider(height: 25, color: greyColor, thickness: 1),
          Text(
            model.categoryName,
            style: Styles.title15,
          ),
        ],
      ),
    );
  }
}
