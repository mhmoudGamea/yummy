import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/features/user/home/presentation/model_views/cart_cubit/cart_cubit.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/cart/c_fixed_order_button.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/cart/cart_list_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = BlocProvider.of<CartCubit>(context);
    return Column(children: [
      Expanded(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          separatorBuilder: ((context, index) => const SizedBox(height: 20)),
          itemBuilder: ((context, index) => CartListItem(
              key: ValueKey(cartData.getCartList[index].cartId),
              cartModel: cartData.getCartList[index])),
          itemCount: cartData.getCartList.length,
        ),
      ),
      const CFixedOrderButton(
          bgColor: primaryColor, textColor: Colors.white, text: 'Order Now'),
    ]);
  }
}
