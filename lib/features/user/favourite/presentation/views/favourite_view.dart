import 'package:flutter/material.dart';
import 'package:yummy/core/utils/helper.dart';

import 'widgets/favourite_view_body.dart';

class FavouriteView extends StatelessWidget {
  static const String rn = '/favouriteView';
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.appBar(
        context: context,
        text: 'Favourite',
        bgColor: Colors.white,
        textColor: Colors.black,
        iconColor: Colors.red,
        leading: false,
        elevation: 2,
      ),
      body: const SafeArea(
        child: FavouriteViewBody(),
      ),
    );
  }
}
