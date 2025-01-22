import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  final FirebaseFirestore _store = GetIt.I.get<FirebaseFirestore>();
  final FirebaseAuth _auth = GetIt.I.get<FirebaseAuth>();

  // this function is used to get total price of all products in user cart
  // total = productPrice * productQuantity

  var _totalPrice = 0.0;

  double get getTotalPrice {
    return _totalPrice;
  }

  set setTotalPrice(double value) {
    _totalPrice = value;
  }

  // this function is used to calculate total price of all elements in cart
  Future<void> calculateTotalPrice() async {
    emit(TotalPriceLoading());
    _store
        .collection(kUsersCollection)
        .doc(_auth.currentUser!.uid)
        .collection(kCartCollection)
        .snapshots()
        .listen((event) {
      if (event.docs.isNotEmpty) {
        _totalPrice = 0.0;
        for (var item in event.docs) {
          _totalPrice += double.parse(item.data()['productPrice']) *
              item.data()['productQuantity'];
        }
        emit(TotalPriceSuccess(totalPrice: _totalPrice));
      }
    }, onError: (error) => emit(TotalPriceFailure()));
  }

  // when we execute payment successfully by paypal or paymob we should delete all elements from the cart
  // so this function will do that
  Future<void> deleteAllCart() async {
    setTotalPrice = 0.0;
    await _store
        .collection('baskets')
        .doc(uid)
        .collection('cart')
        .get()
        .then((value) {
      value.docs.forEach((element) async {
        await element.reference.delete();
      });
    });
  }
}
