import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/core/widgets/c_circle_loading.dart';
import 'package:yummy/features/user/payment/presentation/model-views/paymob/paymob_cubit.dart';
import 'package:yummy/features/user/payment/presentation/views/widgets/payment_button.dart';

import '../../../data/paypal_model/order_model.dart';
import '../paymob_registration_view.dart';

class PaymentViewBody extends StatelessWidget {
  final OrderModel orderModel;
  const PaymentViewBody({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<PaymobCubit>(context);
    var loading = false;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          PaymentButton(
            image: 'assets/images/paypal.png',
            onPress: () {
              orderModel.orderDate = DateTime.now().toString();
              // Helper.paymentWithPaypal(context, orderModel);
            },
          ),
          const SizedBox(height: 20),
          //paymob
          BlocConsumer<PaymobCubit, PaymobState>(
            listener: (context, state) {
              if (state is PaymobAuthenticationLoading) {
                loading = true;
              } else {
                loading = false;
              }
              if (state is PaymobAuthenticationSuccess) {
                GoRouter.of(context).push(PaymobRegistrationView.rn,
                    extra: orderModel.totalPrice.toStringAsFixed(2));
              }
            },
            builder: (context, state) {
              return loading
                  ? const Center(
                      child: CCircleLoading(),
                    )
                  : PaymentButton(
                      image: 'assets/images/paymob.png',
                      onPress: () async {
                        await data.authenticationRequest();
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
