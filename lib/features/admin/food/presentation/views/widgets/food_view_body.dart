import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yummy/features/admin/food/presentation/model_views/food_cubit/food_cubit.dart';
import 'package:yummy/features/admin/food/presentation/views/widgets/c_food_grid.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/c_circle_loading.dart';
import 'food_dialog.dart';

class FoodViewBody extends StatelessWidget {
  const FoodViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final food = BlocProvider.of<FoodCubit>(context);
    var loading = false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          BlocConsumer<FoodCubit, FoodState>(
            listener: (context, state) {
              if (state is SaveLoading) {
                loading = true;
              } else {
                loading = false;
              }
            },
            builder: (context, state) {
              return Row(
                children: [
                  const Spacer(),
                  loading
                      ? const CCircleLoading()
                      : const Text(
                          'Add or swipe to delete category',
                          style: Styles.title14,
                        ),
                  const Spacer(),
                  AbsorbPointer(
                    absorbing: loading ? true : false,
                    child: IconButton(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      constraints: const BoxConstraints(),
                      icon: const Icon(FontAwesomeIcons.plus,
                          size: 18, color: primaryColor),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => BlocProvider.value(
                            value: food,
                            child: const FoodDialog(),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            },
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 3,
            color: primaryColor,
          ),
          const SizedBox(height: 10),
          const CFoodGrid(),
        ],
      ),
    );
  }
}
