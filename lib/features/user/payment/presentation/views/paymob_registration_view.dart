import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/payment/domain/repos/paymob_repo/paymob_repo_impl.dart';
import 'package:yummy/features/user/payment/presentation/model-views/paymob/paymob_cubit.dart';

import 'widgets/paymob_registration_view_body.dart';

class PaymobRegistrationView extends StatelessWidget {
  static const String rn = '/paymobRegistration';
  final String total;
  const PaymobRegistrationView({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymobCubit(PaymobRepoImpl()),
      child: Scaffold(
        body: SafeArea(child: PaymobRegistrationViewBody(total: total)),
      ),
    );
  }
}
