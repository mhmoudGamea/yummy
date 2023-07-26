import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/widgets/c_circle_loading.dart';
import 'package:yummy/features/user/home/presentation/model_views/cart_cubit/cart_cubit.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/cart/c_fixed_order_button.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/cart/cart_list_item.dart';

import '../../../../../../../core/utils/helper.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore store = GetIt.I.get<FirebaseFirestore>();
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
        child: StreamBuilder<QuerySnapshot>(
          stream: store
              .collection('baskets')
              .doc(uid)
              .collection('cart')
              .snapshots(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CCircleLoading());
            }

            cartData.getCartItemsFromSnapshot(snapshot.data!);
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              separatorBuilder: ((context, index) =>
                  const SizedBox(height: 20)),
              itemBuilder: ((context, index) => CartListItem(
                  key: ValueKey(cartData.getCartList[index].cartId),
                  cartModel: cartData.getCartList[index])),
              itemCount: cartData.getCartList.length,
            );
          }),
        ),
      ),
      const CFixedOrderButton(
        bgColor: primaryColor,
        textColor: Colors.white,
        text: 'Order Now',
      ),
    ]);
  }
}
