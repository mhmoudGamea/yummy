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

// states of cart items length
// first state indicate => user add new product to cart or the cart is not empty
class GetCartItemsLoading extends CartState {}

class CartItemLengthChanged extends CartState {
  final int cartItemsLength;
  CartItemLengthChanged({required this.cartItemsLength});
}

// states to delete item from cart
class DeleteItemLoading extends CartState {}

class DeleteItemSuccess extends CartState {}

class DeleteItemFailure extends CartState {}
