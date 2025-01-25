import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/payment/presentation/model-views/payment_details/payment_details_cubit.dart';
import 'package:yummy/features/user/payment/presentation/views/widgets/payment_success_view_body.dart';

class PaymentSuccessView extends StatelessWidget {
  static const String rn = '/paymentSuccess';
  final String orderId;
  const PaymentSuccessView({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PaymentDetailsCubit()..getOrderDetails(orderId: orderId),
      child: Scaffold(
        body: SafeArea(
          child: PaymentSuccessViewBody(orderId: orderId),
        ),
      ),
    );
  }
}
