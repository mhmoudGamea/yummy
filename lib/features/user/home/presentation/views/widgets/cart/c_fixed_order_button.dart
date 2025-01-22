import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/features/user/home/presentation/model_views/order_cubit/order_cubit.dart';

import '../../../../../../../core/config/app_colors.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../../../payment/presentation/views/payment_view.dart';

class CFixedOrderButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String text;
  const CFixedOrderButton({
    super.key,
    required this.bgColor,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final orderData = BlocProvider.of<OrderCubit>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Total',
                style: Styles.title14.copyWith(color: AppColors.greyColor),
              ),
              const SizedBox(height: 5),
              BlocBuilder<OrderCubit, OrderState>(
                builder: (context, state) {
                  return Text(
                    'E£ ${orderData.getTotalPrice.toStringAsFixed(2)}',
                    style:
                        Styles.title16.copyWith(color: AppColors.primaryColor),
                  );
                },
              ),
            ],
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.22),
          Expanded(
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(PaymentView.rn,
                    extra: double.parse(
                        orderData.getTotalPrice.toStringAsFixed(2)));
              },
              child: BlocBuilder<OrderCubit, OrderState>(
                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: bgColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/order.png',
                            width: 20, color: Colors.white),
                        const SizedBox(width: 15),
                        Text(
                          text,
                          style: Styles.title15.copyWith(color: textColor),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
