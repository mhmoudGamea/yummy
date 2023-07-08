import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/helper.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  // this is a local variable 'll not stored on firebase
  // it define only the initial quantity for the product
  var _quantity = 1;

  int get getQuantity {
    return _quantity;
  }

  void increaseQuantity(BuildContext context) {
    if (_quantity < 20) {
      _quantity++;
      emit(QuantityIncrease());
    } else {
      Helper.showCustomToast(
          context: context,
          bgColor: primaryColor.withOpacity(0.7),
          icon: FontAwesomeIcons.triangleExclamation,
          msg: 'Sorry it\'s not allowed to increase than 20');
    }
  }

  void decreaseQuantity() {
    if (_quantity > 1) {
      _quantity--;
      emit(QuantityDecrease());
    }
  }

  // now we finish quantity functionality and 'll begin at cart functionality
}
