import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/helper.dart';

import '../../../data/data/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final FirebaseFirestore _store = GetIt.I.get<FirebaseFirestore>();

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
  //1- first i will loop on cart collection if i didn't find any doc then it's the first doc so i 'll add it
  //2- if i find docs then i 'll check if this cartModel was stored before then i 'll increase it's quantity
  //3- else i 'll save it. this step 'll happen by the help of newElementInCart flag
  Future<void> addToCart(
      {required String productId, required CartModel cartModel}) async {
    var newElementInCart = true;
    var data =
        await _store.collection('baskets').doc(uid).collection('cart').get();
    if (data.docs.isNotEmpty) {
      for (var element in data.docs) {
        if (element.id == productId) {
          element.reference.update({
            'productQuantity':
                element['productQuantity'] + cartModel.productQuantity
          });
          newElementInCart = false;
          return;
        }
      }
      if (newElementInCart) {
        await addElementInCart(productId, cartModel);
      }
    } else {
      await addElementInCart(productId, cartModel);
    }
  }

  // just to avoid code redundancy
  Future<void> addElementInCart(String productId, CartModel cartModel) async {
    await _store
        .collection('baskets')
        .doc(uid)
        .collection('cart')
        .doc(productId)
        .set(cartModel.toJson());
  }
}
