import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/config/app_colors.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../../../../../core/widgets/loading_circle.dart';
import '../../../model_views/cart_cubit/cart_cubit.dart';
import '../../cart_view.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(CartView.rn);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset('assets/images/cart.png', width: 22),
          Positioned(
            top: 0,
            right: -5,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is GetCartItemsLoading) {
                    return LoadingCircle();
                  } else if (state is GetCartItemsFailure) {
                    Text('fail');
                  }
                  return Text(
                    cartCubit.getCartList.length.toString(),
                    style: Styles.title12.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
