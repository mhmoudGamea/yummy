import 'package:flutter/material.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/widgets/c_error_widget.dart';
import '../../../data/models/favourite_model.dart';
import 'c_list_view_item.dart';

class CFavListView extends StatelessWidget {
  final List<FavouriteModel> model;
  const CFavListView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model.isEmpty
        ? CErrorWidget(
            text:
                'No favourites to display yet, please go to home and add some food to your favourites.',
            icon: Icons.favorite_rounded,
            bgColor: primaryColor,
          )
        : Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) =>
                  CListViewItem(model: model[index]),
              itemCount: model.length,
            ),
          );
  }
}
