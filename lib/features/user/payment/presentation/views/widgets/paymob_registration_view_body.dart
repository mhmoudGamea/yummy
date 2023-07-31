import 'package:flutter/material.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/features/user/payment/presentation/views/widgets/paymob_form.dart';

class PaymobRegistrationViewBody extends StatelessWidget {
  final String total;
  const PaymobRegistrationViewBody({Key? key, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [primaryColor, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 0.5]),
      ),
      child: PaymobForm(total: total),
    );
  }
}
