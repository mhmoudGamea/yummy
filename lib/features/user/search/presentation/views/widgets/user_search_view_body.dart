import 'package:flutter/material.dart';
import 'package:yummy/features/user/search/presentation/views/widgets/c_popular_food_stream.dart';

import 'c_header.dart';
import 'c_people_are_looking_stream.dart';
import 'c_search_field.dart';

class UserSearchViewBody extends StatelessWidget {
  const UserSearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CSearchField(),
          SizedBox(height: 25),
          CHeader(headerName: 'Popular Food'),
          SizedBox(height: 10),
          CPopularFoodStream(),
          SizedBox(height: 25),
          CHeader(headerName: 'People are looking'),
          SizedBox(height: 10),
          CPeopleAreLookingStream()
        ],
      ),
    );
  }
}
