import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/features/user/favourite/data/models/favourite_model.dart';
import 'package:yummy/features/user/favourite/presentation/views/widgets/c_fav_list_view.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/widgets/c_circle_loading.dart';
import '../../../../../../core/widgets/c_error_widget.dart';

class CFavStreamBuilder extends StatelessWidget {
  const CFavStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore store = GetIt.I.get<FirebaseFirestore>();
    return StreamBuilder<QuerySnapshot>(
      stream: store.collection('food').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CCircleLoading(),
          );
        } else if (snapshot.hasData) {
          List<FavouriteModel> model = [];
          for (var element in snapshot.data!.docs) {
            model.add(FavouriteModel.fromJson(
                element.data() as Map<String, dynamic>));
          }
          return CFavListView(model: model);
        }
        return CErrorWidget(
            icon: FontAwesomeIcons.triangleExclamation,
            text: 'Oops some error happining.',
            bgColor: secondaryColor);
      },
    );
  }
}
