import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/payment/domain/repos/paypal_repo/paypal_repo.dart';

import '../../../domain/paypal_entity/order_entity.dart';
import 'paypal_state.dart';

class PaypalCubit extends Cubit<PaypalState> {
  PaypalCubit(this._paypalRepo) : super(PaypalInitial());
  final PaypalRepo _paypalRepo;

  Future<void> getUserAddress() async {
    emit(AddressLoading());
    final result = await _paypalRepo.getUserAddress();
    result.fold(
      (failure) => emit(AddressError()),
      (addressEntity) => emit(
        AddressSuccess(
          country: addressEntity.country,
          state: addressEntity.state,
          city: addressEntity.city,
          street: addressEntity.street,
          zip: addressEntity.zip,
        ),
      ),
    );
  }

  Future<void> paymentWithPaypal(
      BuildContext context, OrderEntity orderEntity) async {
    // log(orderEntity.toString());
    emit(PaypalLoading());

    final result = await _paypalRepo.paymentWithPaypal(context, orderEntity);
    result.fold(
      (failure) => emit(PaypalError()),
      (success) async {
        await _paypalRepo.saveUserOrder(orderEntity);
        emit(PaypalSuccess());
      },
    );
  }
}
