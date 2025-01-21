import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/core/widgets/tabs_view.dart';
import 'package:yummy/features/user/home/presentation/model_views/order_cubit/order_cubit.dart';

import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/c_expanded_button.dart';

class PaymentSuccessViewBody extends StatelessWidget {
  const PaymentSuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = BlocProvider.of<OrderCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/success.png', height: 150),
          const SizedBox(height: 15),
          Text(
            'You placed the order successfully',
            style: Styles.title16,
          ),
          const SizedBox(height: 20),
          CExpandedButton(
            text: 'Back to home',
            bgColor: AppColors.primaryColor,
            onPress: () {
              orderData.deleteAllCart();
              GoRouter.of(context).pushReplacement(TabsView.rn);
            },
          )
        ],
      ),
    );
  }
}
