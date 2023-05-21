import 'package:flutter/material.dart';
import 'package:yummy/features/user/search/data/models/search_model.dart';
import 'package:yummy/features/user/search/presentation/views/widgets/c_popular_food_list_item.dart';

class CPopularFoodList extends StatelessWidget {
  final List<SearchModel> popularFoodList;
  const CPopularFoodList({Key? key, required this.popularFoodList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: popularFoodList.length,
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemBuilder: (context, index) =>
            CPopularFoodListItem(model: popularFoodList[index]),
      ),
    );
  }
}
