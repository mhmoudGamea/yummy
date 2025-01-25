import 'package:flutter/material.dart';
import 'package:yummy/core/config/app_colors.dart';

import '../../../data/paypal_model/order_model.dart';
import 'paypal_form.dart';

class PaypalRegistrationViewBody extends StatelessWidget {
  static const rn = '/paypalWebview';
  final OrderModel orderModel;
  const PaypalRegistrationViewBody({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5],
        ),
      ),
      child: PaypalForm(orderModel: orderModel),
    );
  }
}
