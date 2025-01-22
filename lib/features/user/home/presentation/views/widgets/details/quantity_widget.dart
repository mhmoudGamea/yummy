import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/utils/styles.dart';
import 'package:yummy/features/user/home/presentation/model_views/cart_cubit/cart_cubit.dart';

import '../../../../../../../core/config/app_colors.dart';
import 'quantity_button.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartData = BlocProvider.of<CartCubit>(context);
    return Row(
      children: [
        const Expanded(child: SizedBox()),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.greyColor.withAlpha((0.2 * 255).toInt()),
          ),
          child: Row(
            children: [
              QuantityButton(onPress: () {}, icon: Icons.remove),
              const SizedBox(width: 8),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Text(
                    '${cartData.getQuantity}',
                    style: Styles.title14,
                  );
                },
              ),
              const SizedBox(width: 8),
              QuantityButton(
                  onPress: () {
                    // cartData.increaseQuantity(context);
                  },
                  icon: Icons.add),
            ],
          ),
        ),
      ],
    );
  }
}
