import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/features/user/payment/presentation/views/widgets/payment_button.dart';

import 'payment_webview.dart';

class PaymentViewBody extends StatelessWidget {
  final double total;
  const PaymentViewBody({Key? key, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          PaymentButton(
            image: 'assets/images/paypal.png',
            onPress: () {
              GoRouter.of(context).push(PaymentWebview.rn, extra: total);
            },
          ),
          const SizedBox(height: 15),
          PaymentButton(
            image: 'assets/images/paymob.png',
            onPress: () {
              GoRouter.of(context).push(PaymentWebview.rn, extra: total);
            },
          ),
        ],
      ),
    );
  }
}
