import 'package:flutter/material.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/cart/cart_view_body.dart';

class CartView extends StatelessWidget {
  static const String rn = '/cartView';
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CartViewBody(),
      ),
    );
  }
}
