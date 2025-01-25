import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/core/config/app_colors.dart';
import 'package:yummy/core/utils/styles.dart';
import 'package:yummy/features/user/payment/presentation/model-views/payment_details/payment_details_cubit.dart';

import '../../../domain/paypal_entity/order_entity.dart';

class SuccessfulPaymentDetails extends StatelessWidget {
  final OrderEntity orderEntity;
  const SuccessfulPaymentDetails({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    final paymentCubit = BlocProvider.of<PaymentDetailsCubit>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFE9EEF4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        spacing: 10,
        children: [
          PaymentDetailsItem(title: 'Order Id', subtitle: orderEntity.orderId),
          PaymentDetailsItem(
              title: 'Pay',
              subtitle: '${orderEntity.totalPrice.toStringAsFixed(2)} E£'),
          PaymentDetailsItem(title: 'Discount', subtitle: '0.0 E£'),
          PaymentDetailsItem(
              title: 'Total',
              subtitle: '${orderEntity.totalPrice.toStringAsFixed(2)} E£'),
          PaymentDetailsItem(
              title: 'Pay Date',
              subtitle:
                  paymentCubit.getOrderPaymentDate(orderEntity.orderDate)),
        ],
      ),
    );
  }
}

class PaymentDetailsItem extends StatelessWidget {
  const PaymentDetailsItem(
      {super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.title14.copyWith(color: Colors.black38),
        ),
        Text(
          subtitle,
          style: Styles.title14.copyWith(color: AppColors.greyColor2),
        ),
      ],
    );
  }
}
