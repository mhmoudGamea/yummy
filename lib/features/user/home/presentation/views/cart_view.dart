import 'package:flutter/material.dart';

import '../../../../../core/utils/helper.dart';
import 'widgets/cart/cart_view_body.dart';

class CartView extends StatelessWidget {
  static const String rn = '/cartView';
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.appBar(
        context: context,
        text: 'Cart',
        bgColor: Colors.white,
        textColor: Colors.black,
        leading: true,
        elevation: 2,
        iconColor: Colors.black,
      ),
      body: const SafeArea(
        child: CartViewBody(),
      ),
    );
  }
}
