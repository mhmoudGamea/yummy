import 'package:flutter/material.dart';

import 'widgets/food_details_view_body.dart';

class FoodDetailsView extends StatelessWidget {
  static const String rn = '/foodDetailsView';
  const FoodDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: FoodDetailsViewBody(),
      ),
    );
  }
}
