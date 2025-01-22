import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/payment/domain/repos/paymob_repo/paymob_repo_impl.dart';
import 'package:yummy/features/user/payment/presentation/model-views/paymob/paymob_cubit.dart';

import '../../../../../core/utils/helper.dart';
import '../../data/models/paypal_model/order_model.dart';
import '../model-views/paypal/paypal_cubit.dart';
import 'widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  static const String rn = '/paymentView';
  final OrderModel orderModel;
  const PaymentView({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PaymobCubit(PaymobRepoImpl())),
        BlocProvider(create: (context) => PaypalCubit()),
      ],
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
