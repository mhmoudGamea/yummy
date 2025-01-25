import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/core/widgets/tabs_view.dart';
import 'package:yummy/features/user/home/presentation/model_views/order_cubit/order_cubit.dart';
import 'package:yummy/features/user/payment/presentation/model-views/payment_details/payment_details_cubit.dart';
import 'package:yummy/features/user/payment/presentation/model-views/payment_details/payment_details_state.dart';

import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/c_circle_loading.dart';
import '../../../../../../core/widgets/c_error_widget.dart';
import '../../../../../../core/widgets/c_expanded_button.dart';
import 'successful_payment_details.dart';

class PaymentSuccessViewBody extends StatelessWidget {
  final String orderId;
  const PaymentSuccessViewBody({super.key, required this.orderId});

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
            'Great',
            style: Styles.title17.copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(height: 10),
          Text(
            'You placed the order successfully',
            style: Styles.title16,
          ),
          const SizedBox(height: 10),
          BlocBuilder<PaymentDetailsCubit, PaymentDetailsState>(
            builder: (context, state) {
              if (state is PaymentDetailsSuccess) {
                return SuccessfulPaymentDetails(orderEntity: state.orderEntity);
              } else if (state is PaymentDetailsFailure) {
                return CErrorWidget(
                    text: state.error, bgColor: Colors.red, icon: Icons.error);
              } else {
                return const CCircleLoading();
              }
            },
          ),
          const SizedBox(height: 20),
          CExpandedButton(
            text: 'View Map',
            bgColor: AppColors.primaryColor3,
            textColor: Colors.white,
            onPress: () {
              // orderData.deleteAllCart();
              // GoRouter.of(context).pushReplacement(TabsView.rn);
            },
          ),
          const SizedBox(height: 10),
          CExpandedButton(
            text: 'Back to home',
            bgColor: AppColors.primaryColor,
            textColor: Colors.white,
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
