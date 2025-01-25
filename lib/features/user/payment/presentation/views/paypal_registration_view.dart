import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/paypal_model/order_model.dart';
import '../../domain/repos/paypal_repo/paypal_repo_impl.dart';
import '../model-views/paypal/paypal_cubit.dart';
import 'widgets/paypal_registration_view_body.dart';

class PaypalRegistrationView extends StatelessWidget {
  static const rn = '/paypal_registration';
  final OrderModel orderModel;
  const PaypalRegistrationView({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PaypalCubit(PaypalRepoImpl()),
        child: SafeArea(
          child: PaypalRegistrationViewBody(orderModel: orderModel),
        ),
      ),
    );
  }
}
