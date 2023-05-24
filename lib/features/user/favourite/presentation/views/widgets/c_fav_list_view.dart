import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/features/user/home/data/data/user_food_model.dart';
import 'package:yummy/features/user/home/presentation/views/food_details_view.dart';

import '../../../data/models/favourite_model.dart';
import './c_list_view_item.dart';

class CFavListView extends StatelessWidget {
  final List<FavouriteModel> model;
  const CFavListView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              UserFoodModel userFoodModel =
                  UserFoodModel.fromJson(model[index].toMap());
              GoRouter.of(context)
                  .push(FoodDetailsView.rn, extra: userFoodModel);
            },
            child: CListViewItem(
                key: ValueKey(model[index].id), model: model[index])),
        itemCount: model.length,
      ),
    );
  }
}
