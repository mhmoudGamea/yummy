part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class GetTotalPriceSuccess extends OrderState {
  final double totalPrice;
  GetTotalPriceSuccess({required this.totalPrice});
}

class GetTotalPriceFailure extends OrderState {}
