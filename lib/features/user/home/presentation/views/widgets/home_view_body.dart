import 'package:flutter/material.dart';

import 'c_app_bar.dart';
import 'c_categories.dart';
import 'c_curosal_slider.dart';
import 'c_header_name.dart';
import 'c_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Column(
          children: [
            CAppBar(),
            SizedBox(height: 10),
            // const CSearchField(),
            SizedBox(height: 10),
            CCurosalSlider(),
            SizedBox(height: 15),
            CHeaderName(name: 'Categories'),
            SizedBox(height: 10),
            CCategories(),
            SizedBox(height: 15),
            CHeaderName(name: 'All'),
            SizedBox(height: 10),
            CListView(),
          ],
        ),
      ),
    );
  }
}
