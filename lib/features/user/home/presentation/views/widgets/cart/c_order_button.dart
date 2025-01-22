import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/features/user/home/presentation/model_views/cart_cubit/cart_cubit.dart';
import 'package:yummy/features/user/payment/data/models/paypal_model/order_model.dart';

import '../../../../../../../core/utils/styles.dart';
import '../../../../../payment/presentation/views/payment_view.dart';
import '../../../model_views/order_cubit/order_cubit.dart';

class COrderButton extends StatelessWidget {
  const COrderButton({
    super.key,
    required this.bgColor,
    required this.text,
    required this.textColor,
  });

  final Color bgColor;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final orderData = BlocProvider.of<OrderCubit>(context);
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          OrderModel orderModel = OrderModel(
            cartItems: cartCubit.getCartList,
            totalPrice:
                double.parse(orderData.getTotalPrice.toStringAsFixed(2)),
            orderId: id,
          );
          GoRouter.of(context).push(PaymentView.rn, extra: orderModel);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: bgColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/order.png',
                  width: 20, color: Colors.white),
              const SizedBox(width: 15),
              Text(
                text,
                style: Styles.title15.copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
