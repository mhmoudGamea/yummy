import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/payment/data/repos/paymob_repo_impl.dart';
import 'package:yummy/features/user/payment/presentation/model-views/paymob/paymob_cubit.dart';

import '../../../../../core/utils/helper.dart';
import 'widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  static const String rn = '/paymentView';
  final double total;
  const PaymentView({Key? key, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymobCubit(PaymobRepoImpl()),
      child: Scaffold(
        appBar: Helper.appBar(
          context: context,
          text: 'Payment',
          bgColor: Colors.white,
          textColor: Colors.black,
          leading: true,
          elevation: 2,
          iconColor: Colors.black,
        ),
        body: SafeArea(
          child: PaymentViewBody(total: total),
        ),
      ),
    );
  }
}
