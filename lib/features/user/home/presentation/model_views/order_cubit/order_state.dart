part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class TotalPriceLoading extends OrderState {}

class TotalPriceSuccess extends OrderState {
  final double totalPrice;
  TotalPriceSuccess({required this.totalPrice});
}

class TotalPriceFailure extends OrderState {}
