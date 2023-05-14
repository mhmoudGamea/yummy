import 'package:flutter/material.dart';
import 'package:yummy/features/admin/categories/data/models/category_model.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/utils/styles.dart';

class CategoryListItem extends StatelessWidget {
  final CategoryModel model;
  const CategoryListItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          model.image,
          width: 35,
        ),
        const SizedBox(height: 5),
        Text(
          model.categoryName,
          style: Styles.title13.copyWith(color: greyColor2),
        ),
      ],
    );
  }
}
