import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/utils/helper.dart';
import 'package:yummy/features/admin/categories/data/models/category_model.dart';
import 'package:yummy/features/admin/categories/presentation/model_views/cubit/category_cubit.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/utils/styles.dart';

class CategoryGridItem extends StatelessWidget {
  final CategoryModel model;
  const CategoryGridItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<CategoryCubit>(context);
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Helper.dismissBackGround(radius: 10),
      onDismissed: (direction) {
        data.deleteCategory(context, model.id);
      },
      child: Container(
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
      ),
    );
  }
}
