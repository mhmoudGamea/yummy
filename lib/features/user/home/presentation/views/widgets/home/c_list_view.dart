import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/core/widgets/c_circle_loading.dart';
import 'package:yummy/core/widgets/c_error_widget.dart';
import 'package:yummy/features/user/home/data/data/user_food_model.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/home/c_list_view_body.dart';

import '../../../../../../../core/constants.dart';

class CListView extends StatelessWidget {
  const CListView({Key? key}) : super(key: key);

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
          List<UserFoodModel> model = [];
          for (var element in snapshot.data!.docs) {
            model.add(
                UserFoodModel.fromJson(element.data() as Map<String, dynamic>));
          }
          return CListViewBody(model: model);
        }
        return const CErrorWidget(
            icon: FontAwesomeIcons.triangleExclamation,
            text: 'Oops some error happining.',
            bgColor: secondaryColor);
      },
    );
  }
}
