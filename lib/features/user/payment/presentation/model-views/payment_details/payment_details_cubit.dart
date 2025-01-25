import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/features/user/payment/data/paypal_model/order_model.dart';

import 'payment_details_state.dart';

class PaymentDetailsCubit extends Cubit<PaymentDetailsState> {
  PaymentDetailsCubit() : super(PaymentDetailsInitial());

  static final _store = GetIt.instance<FirebaseFirestore>();
  static final _auth = GetIt.instance<FirebaseAuth>();
  final CollectionReference _cartDocs = _store
      .collection(kUsersCollection)
      .doc(_auth.currentUser!.uid)
      .collection(kOrdersCollection);

  Future<void> getOrderDetails({required String orderId}) async {
    try {
      emit(PaymentDetailsLoading());
      final result = await _cartDocs.doc(orderId).get();
      if (result.data() == null) {
        emit(PaymentDetailsFailure(error: 'Order not found'));
      } else {
        emit(PaymentDetailsSuccess(
            orderEntity: OrderModel.toOrderEntity(
                OrderModel.fromJson(result.data() as Map<String, dynamic>))));
      }
    } catch (error) {
      log(error.toString());
      emit(PaymentDetailsFailure(error: error.toString()));
    }
  }

  String getOrderPaymentDate(String paymentDate) {
    DateTime date = DateTime.parse(paymentDate);
    return DateFormat.yMMMd().format(date);
  }
}
