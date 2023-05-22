import 'package:flutter/material.dart';
import 'package:yummy/features/user/search/data/models/search_model.dart';
import 'package:yummy/features/user/search/presentation/views/widgets/c_search_list_item.dart';

class CSearchList extends StatelessWidget {
  final List<SearchModel> searchList;
  const CSearchList({Key? key, required this.searchList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) => CSearchListItem(
          key: ValueKey(searchList[index].id), model: searchList[index]),
      itemCount: searchList.length,
    );
  }
}
