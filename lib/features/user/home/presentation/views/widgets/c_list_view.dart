import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/core/widgets/c_circle_loading.dart';
import 'package:yummy/core/widgets/c_error_widget.dart';
import 'package:yummy/features/user/home/data/data/user_food_model.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/c_list_item.dart';

import '../../../../../../core/constants.dart';
import '../food_details_view.dart';

class CListView extends StatelessWidget {
  const CListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore store = GetIt.I.get<FirebaseFirestore>();
    return StreamBuilder<QuerySnapshot>(
      stream: store.collection('food').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CCircleLoading();
        } else if (snapshot.hasData) {
          List<UserFoodModel> model = [];
          for (var element in snapshot.data!.docs) {
            model.add(
                UserFoodModel.fromJson(element.data() as Map<String, dynamic>));
          }
          if (model.isEmpty) {
            return CErrorWidget(
              text: 'No categories to display yet.',
              icon: FontAwesomeIcons.triangleExclamation,
              bgColor: primaryColor,
            );
          }
          return Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(FoodDetailsView.rn);
                  },
                  child: CListItem(model: model[index])),
              itemCount: model.length,
            ),
          );
        }
        return CErrorWidget(
            icon: FontAwesomeIcons.triangleExclamation,
            text: 'Oops some error happining.',
            bgColor: secondaryColor);
      },
    );
  }
}
