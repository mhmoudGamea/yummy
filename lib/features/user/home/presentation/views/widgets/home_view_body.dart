import 'package:flutter/material.dart';

import 'c_app_bar.dart';
import 'c_categories.dart';
import 'c_curosal_slider.dart';
import 'c_search_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Column(
        children: const [
          CAppBar(),
          SizedBox(height: 10),
          CSearchField(),
          SizedBox(height: 10),
          CCurosalSlider(),
          SizedBox(height: 10),
          CCategories(),
        ],
      ),
    );
  }
}
