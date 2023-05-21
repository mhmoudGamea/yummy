import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/widgets/c_circle_loading.dart';
import 'package:yummy/core/widgets/c_error_widget.dart';
import 'package:yummy/features/user/search/data/models/search_model.dart';
import 'package:yummy/features/user/search/presentation/model_views/search_cubit/search_cubit.dart';

import 'c_popular_food_list.dart';

class CPopularFoodStream extends StatelessWidget {
  const CPopularFoodStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore store = GetIt.I.get<FirebaseFirestore>();
    final search = BlocProvider.of<SearchCubit>(context);
    return StreamBuilder<QuerySnapshot>(
      stream: store.collection('food').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              padding: const EdgeInsets.symmetric(vertical: 89),
              height: 210,
              width: 50,
              child: const CCircleLoading());
        } else if (snapshot.hasData) {
          List<SearchModel> popularFoodList =
              search.getPopularFoodList(snapshot, 'Popular Food');
          if (popularFoodList.isEmpty) {
            return CErrorWidget(
                icon: FontAwesomeIcons.triangleExclamation,
                text:
                    'Sorry, we have no items in popular food collection right now.',
                bgColor: primaryColor);
          }
          return CPopularFoodList(popularFoodList: popularFoodList);
        }
        return CErrorWidget(
            icon: FontAwesomeIcons.triangleExclamation,
            text: 'Sorry, unexpected error happen.',
            bgColor: secondaryColor);
      },
    );
  }
}
