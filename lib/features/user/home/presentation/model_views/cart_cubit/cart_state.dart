part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

// 2 states to increase quantity and decrease quantity
class QuantityIncrease extends CartState {}

class QuantityDecrease extends CartState {}
