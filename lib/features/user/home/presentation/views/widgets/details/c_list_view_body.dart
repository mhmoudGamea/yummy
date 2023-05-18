import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/constants.dart';
import '../../../../../../../core/widgets/c_error_widget.dart';
import '../../../../data/data/user_food_model.dart';
import '../../food_details_view.dart';
import '../c_list_item.dart';

class CListViewBody extends StatelessWidget {
  final List<UserFoodModel> model;
  const CListViewBody({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model.isEmpty
        ? CErrorWidget(
            text: 'No categories to display yet.',
            icon: FontAwesomeIcons.triangleExclamation,
            bgColor: primaryColor,
          )
        : Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push(FoodDetailsView.rn, extra: model[index]);
                  },
                  child: CListItem(model: model[index])),
              itemCount: model.length,
            ),
          );
  }
}
