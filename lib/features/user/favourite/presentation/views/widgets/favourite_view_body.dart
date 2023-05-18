import 'package:flutter/material.dart';
import 'package:yummy/core/utils/helper.dart';
import 'package:yummy/features/user/favourite/presentation/views/widgets/c_fav_stream_builder.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Helper.hint(
            text:
                'See the list of likes of your food to order it. press on the "Love" icon to remove it',
            onPress: () {},
          ),
          const SizedBox(height: 15),
          const CFavStreamBuilder()
        ],
      ),
    );
  }
}
