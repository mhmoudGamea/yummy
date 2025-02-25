import 'package:flutter/material.dart';
import 'package:yummy/features/user/search/data/models/search_model.dart';

import 'c_people_are_looking_list_item.dart';

class CPeopleAreLookingList extends StatelessWidget {
  final List<SearchModel> peopleAreLookingList;
  const CPeopleAreLookingList({super.key, required this.peopleAreLookingList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 5),
      itemBuilder: (context, index) => CPeopleAreLookingListItem(
          key: ValueKey(peopleAreLookingList[index].id),
          model: peopleAreLookingList[index]),
      itemCount: peopleAreLookingList.length,
    );
  }
}
