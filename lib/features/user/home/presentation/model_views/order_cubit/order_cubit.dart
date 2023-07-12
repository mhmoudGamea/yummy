import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/constants.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  final FirebaseFirestore _store = GetIt.I.get<FirebaseFirestore>();

  // this function is used to get total price of all products in user cart
  // total = productPrice * productQuantity

  var _totalPrice = 0.0;

  double get getTotalPrice {
    return _totalPrice;
  }

  Future<void> calculateTotalPrice() async {
    _store.collection('baskets').doc(uid).collection('cart').snapshots().listen(
        (event) {
      if (event.docs.isNotEmpty) {
        _totalPrice = 0.0;
        for (var item in event.docs) {
          _totalPrice += double.parse(item.data()['productPrice']) *
              item.data()['productQuantity'];
        }
        emit(GetTotalPriceSuccess(totalPrice: _totalPrice));
      }
    }, onError: (error) => emit(GetTotalPriceFailure()));
  }
}
