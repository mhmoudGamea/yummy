import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/config/app_colors.dart';
import '../../../../../../../core/utils/helper.dart';
import '../../../model_views/cart_cubit/cart_cubit.dart';
import 'c_order_button_container.dart';
import 'cart_list_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cartData = BlocProvider.of<CartCubit>(context);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Helper.hint(
          text:
              'Order your cart items from "Order Now" button or swipe to "Remove" item',
          onPress: () {
            // favourite.understandFav();
          },
        ),
      ),
      Expanded(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          separatorBuilder: ((context, index) => const SizedBox(height: 20)),
          itemBuilder: ((context, index) => CartListItem(
              key: ValueKey(cartData.getCartList[index].productId),
              cartModel: cartData.getCartList[index])),
          itemCount: cartData.getCartList.length,
        ),
      ),
      COrderButtonContainer(
        bgColor: AppColors.primaryColor,
        textColor: Colors.white,
        text: 'Order Now',
      ),
    ]);
  }
}
