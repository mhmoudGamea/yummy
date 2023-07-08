import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/styles.dart';
import 'package:yummy/features/user/home/presentation/views/cart_view.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                '1',
                style: Styles.title12.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
