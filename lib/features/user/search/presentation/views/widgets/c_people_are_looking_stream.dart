import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/features/user/search/data/models/search_model.dart';
import 'package:yummy/features/user/search/presentation/model_views/search_cubit/search_cubit.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/widgets/c_circle_loading.dart';
import '../../../../../../core/widgets/c_error_widget.dart';
import 'c_people_are_looking_list.dart';

class CPeopleAreLookingStream extends StatelessWidget {
  const CPeopleAreLookingStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final search = BlocProvider.of<SearchCubit>(context);
    FirebaseFirestore store = GetIt.I.get<FirebaseFirestore>();
    return StreamBuilder<QuerySnapshot>(
      stream: store.collection('food').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CCircleLoading(),
          );
        } else if (snapshot.hasData) {
          List<SearchModel> peopleAreLookingList =
              search.getPeopleAreLookingList(snapshot, 'People are looking');

          if (peopleAreLookingList.isEmpty) {
            return CErrorWidget(
                icon: FontAwesomeIcons.triangleExclamation,
                text:
                    'Sorry, we have no items in popular food collection right now.',
                bgColor: primaryColor);
          }

          return CPeopleAreLookingList(
              peopleAreLookingList: peopleAreLookingList);
        }
        return CErrorWidget(
            icon: FontAwesomeIcons.triangleExclamation,
            text: 'Sorry, unexpected error happen.',
            bgColor: secondaryColor);
      },
    );
  }
}
