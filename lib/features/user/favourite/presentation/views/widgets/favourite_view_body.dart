import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/favourite/presentation/model_views/favourite/favourite_cubit.dart';

import '../../../../../../core/utils/helper.dart';
import 'c_fav_stream_builder.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Helper.hint(
                text:
                    'See the list of likes of your food to order it. press on the "Love" icon to remove it',
              ),
              const SizedBox(height: 15),
              const CFavStreamBuilder()
            ],
          ),
        );
      },
    );
  }
}
