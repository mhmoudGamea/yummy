import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/payment/domain/repos/paypal_repo/paypal_repo.dart';

import '../../../domain/paypal_entity/order_entity.dart';
import 'paypal_state.dart';

class PaypalCubit extends Cubit<PaypalState> {
  PaypalCubit(this._paypalRepo) : super(PaypalInitial());
  final PaypalRepo _paypalRepo;

  Future<void> paymentWithPaypal(
      BuildContext context, OrderEntity orderEntity) async {
    emit(PaypalLoading());

    final result = await _paypalRepo.paymentWithPaypal(context, orderEntity);
    result.fold(
      (failure) => emit(PaypalError()),
      (success) => emit(PaypalSuccess()),
    );
  }
}
