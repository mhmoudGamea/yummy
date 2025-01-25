import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/widgets/c_circle_loading.dart';
import '../../../data/paypal_model/order_model.dart';
import '../../model-views/paymob/paymob_cubit.dart';
import '../paymob_registration_view.dart';
import '../paypal_registration_view.dart';
import 'payment_button.dart';

class PaymentViewBody extends StatelessWidget {
  final OrderModel orderModel;
  const PaymentViewBody({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    final paymobCubit = BlocProvider.of<PaymobCubit>(context);
    var loading = false;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          //paypal
          PaymentButton(
            image: 'assets/images/paypal.png',
            onPress: () {
              GoRouter.of(context)
                  .push(PaypalRegistrationView.rn, extra: orderModel);
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
                        await paymobCubit.authenticationRequest();
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
