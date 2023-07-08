import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/styles.dart';
import 'package:yummy/features/user/home/presentation/model_views/cart_cubit/cart_cubit.dart';

import 'quantity_button.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({Key? key}) : super(key: key);

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
            color: greyColor.withOpacity(0.2),
          ),
          child: Row(
            children: [
              QuantityButton(
                  onPress: cartData.decreaseQuantity, icon: Icons.remove),
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
                    cartData.increaseQuantity(context);
                  },
                  icon: Icons.add),
            ],
          ),
        ),
      ],
    );
  }
}
