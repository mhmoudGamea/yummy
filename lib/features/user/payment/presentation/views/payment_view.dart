import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/helper.dart';
import '../../data/paypal_model/order_model.dart';
import '../../domain/repos/paymob_repo/paymob_repo_impl.dart';
import '../model-views/paymob/paymob_cubit.dart';
import 'widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  static const String rn = '/paymentView';
  final OrderModel orderModel;
  const PaymentView({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymobCubit(PaymobRepoImpl()),
      child: Scaffold(
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
          child: PaymentViewBody(orderModel: orderModel),
        ),
      ),
    );
  }
}
