import 'package:flutter/material.dart';
import 'package:yummy/features/user/payment/presentation/views/widgets/paymob_form.dart';

import '../../../../../../core/config/app_colors.dart';

class PaymobRegistrationViewBody extends StatelessWidget {
  final String total;
  const PaymobRegistrationViewBody({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [AppColors.primaryColor, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 0.5]),
      ),
      child: PaymobForm(total: total),
    );
  }
}
