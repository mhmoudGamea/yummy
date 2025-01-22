import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/config/app_colors.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../model_views/order_cubit/order_cubit.dart';

class COrderTotal extends StatelessWidget {
  const COrderTotal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final orderData = BlocProvider.of<OrderCubit>(context);
    return Column(
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
              style: Styles.title16.copyWith(color: AppColors.primaryColor),
            );
          },
        ),
      ],
    );
  }
}
