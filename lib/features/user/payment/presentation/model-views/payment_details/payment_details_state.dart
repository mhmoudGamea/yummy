import '../../../domain/paypal_entity/order_entity.dart';

abstract class PaymentDetailsState {}

class PaymentDetailsInitial extends PaymentDetailsState {}

class PaymentDetailsLoading extends PaymentDetailsState {}

class PaymentDetailsSuccess extends PaymentDetailsState {
  final OrderEntity orderEntity;
  PaymentDetailsSuccess({required this.orderEntity});
}

class PaymentDetailsFailure extends PaymentDetailsState {
  final String error;
  PaymentDetailsFailure({required this.error});
}
