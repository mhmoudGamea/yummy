import 'package:flutter/material.dart';

import '../../../../../core/utils/helper.dart';
import 'widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  static const String rn = '/paymentView';
  final double total;
  const PaymentView({Key? key, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.appBar(
        context: context,
        text: 'Payment',
        bgColor: Colors.white,
        textColor: Colors.black,
        leading: true,
        elevation: 2,
        iconColor: Colors.black,
      ),
      body: SafeArea(
        child: PaymentViewBody(total: total),
      ),
    );
  }
}
