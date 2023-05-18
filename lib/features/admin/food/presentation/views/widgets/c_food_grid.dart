import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/widgets/c_circle_loading.dart';
import '../../../../../../core/widgets/c_error_widget.dart';
import '../../../data/models/admin_food_model.dart';
import 'c_grid_item.dart';

class CFoodGrid extends StatelessWidget {
  const CFoodGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore store = GetIt.I.get<FirebaseFirestore>();
    return StreamBuilder<QuerySnapshot>(
      stream: store.collection('food').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
                height: 260,
                padding: const EdgeInsets.symmetric(vertical: 112),
                child: const CCircleLoading()),
          );
        } else if (snapshot.hasData) {
          List<AdminFoodModel> model = [];
          for (var element in snapshot.data!.docs) {
            model.add(AdminFoodModel.fromJson(
                element.data() as Map<String, dynamic>));
          }
          if (model.isEmpty) {
            return CErrorWidget(
              text: 'No categories to display yet.',
              icon: FontAwesomeIcons.triangleExclamation,
              bgColor: primaryColor,
            );
          }
          return Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 19 / 28,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5),
              itemBuilder: (context, index) =>
                  CGridItem(adminFoodModel: model[index]),
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
