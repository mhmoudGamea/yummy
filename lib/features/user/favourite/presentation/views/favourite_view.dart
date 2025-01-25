import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/utils/helper.dart';
import 'package:yummy/features/user/favourite/presentation/model_views/favourite/favourite_cubit.dart';

import 'widgets/favourite_view_body.dart';

class FavouriteView extends StatelessWidget {
  static const String rn = '/favouriteView';
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteCubit(),
      child: Scaffold(
        appBar: Helper.appBar(
          context: context,
          text: 'Favourite',
          bgColor: Colors.white,
          textColor: Colors.black,
          leading: true,
          iconColor: Colors.black,
          elevation: 2,
        ),
        body: const SafeArea(
          child: FavouriteViewBody(),
        ),
      ),
    );
  }
}
