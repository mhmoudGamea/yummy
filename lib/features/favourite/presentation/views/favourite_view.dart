import 'package:flutter/material.dart';

import 'widgets/favourite_view_body.dart';

class FavouriteView extends StatelessWidget {
  static const String rn = '/favouriteView';
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FavouriteViewBody(),
      ),
    );
  }
}
