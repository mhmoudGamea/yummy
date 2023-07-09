part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

// 2 states to increase quantity and decrease quantity
class QuantityIncrease extends CartState {}

class QuantityDecrease extends CartState {}

// 3 states to add to cart
class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {}

class AddToCartSuccessWithIncreaseQuantity extends CartState {}

class AddToCartFailure extends CartState {}
