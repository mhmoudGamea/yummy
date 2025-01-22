import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:yummy/core/constants.dart';
import '../../../data/data/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static final FirebaseFirestore _store = GetIt.I.get<FirebaseFirestore>();
  static final FirebaseAuth _auth = GetIt.instance<FirebaseAuth>();
  final _cartDocs = _store
      .collection(kUsersCollection)
      .doc(_auth.currentUser!.uid)
      .collection(kCartCollection);

  // this is a local variable 'll not stored on firebase
  // it define only the initial quantity for the product
  final _quantity = 1;

  int get getQuantity {
    return _quantity;
  }

  final List<CartModel> _cartList = [];

  List<CartModel> get getCartList {
    return [..._cartList];
  }

  int getItemIndex(String elementId) {
    return _cartList.indexWhere((item) {
      log("Comparing item.productId: ${item.productId} with element.id: $elementId");
      return item.productId == elementId;
    });
  }

  Future<void> addToCart({required CartModel cartModel}) async {
    emit(AddToCartLoading());
    var newElementInCart = true;

    final cartDocs = await _cartDocs.get();
    try {
      if (cartDocs.docs.isNotEmpty) {
        for (var element in cartDocs.docs) {
          if (element.id == cartModel.productId) {
            element.reference
                .update({'productQuantity': FieldValue.increment(1)});
            var index = getItemIndex(cartModel.productId);
            if (index != -1) {
              _cartList[index].productQuantity += 1;
              newElementInCart = false;
              emit(AddToCartSuccessWithIncreaseQuantity());
            }
            return;
          }
        }
        if (newElementInCart) {
          await addElementInCart(cartModel);
          _cartList.add(cartModel);
          emit(AddToCartSuccess());
        }
      } else {
        await addElementInCart(cartModel);
        _cartList.add(cartModel);
        emit(AddToCartSuccess());
      }
    } catch (error) {
      emit(AddToCartFailure());
    }
  }

  // just to avoid code redundancy
  Future<void> addElementInCart(CartModel cartModel) async {
    await _store
        .collection(kUsersCollection)
        .doc(_auth.currentUser!.uid)
        .collection(kCartCollection)
        .doc(cartModel.productId)
        .set(cartModel.toJson());
  }

  Future<void> getCartItems() async {
    emit(GetCartItemsLoading());
    try {
      _cartList.clear();
      final cartDocs = await _cartDocs.get();
      if (cartDocs.docs.isNotEmpty) {
        for (var element in cartDocs.docs) {
          _cartList.add(CartModel.fromJson(element.data()));
        }
      }
      emit(GetCartItemsSuccess());
    } catch (error) {
      emit(GetCartItemsFailure());
    }
  }

  // a function to remove or delete item from cart
  Future<void> deleteItemInCart(String productId) async {
    // emit(DeleteItemLoading());
    _store
        .collection('baskets')
        .doc(uid)
        .collection('cart')
        .doc(productId)
        .delete();
  }
}
