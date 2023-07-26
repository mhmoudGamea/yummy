import 'package:flutter/material.dart';
import 'package:yummy/features/user/payment/presentation/views/widgets/payment_success_view_body.dart';

class PaymentSuccessView extends StatelessWidget {
  static const String rn = '/paymentSuccess';
  const PaymentSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: PaymentSuccessViewBody(),
      ),
    );
  }
}
