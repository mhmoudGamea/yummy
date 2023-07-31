part of 'paymob_cubit.dart';

@immutable
abstract class PaymobState {}

class PaymobInitial extends PaymobState {}

class PaymobAuthenticationLoading extends PaymobState {}

class PaymobAuthenticationSuccess extends PaymobState {}

class PaymobAuthenticationFailure extends PaymobState {
  final String error;
  PaymobAuthenticationFailure({required this.error});
}

class PaymobOrderRegistrationLoading extends PaymobState {}

class PaymobOrderRegistrationSuccess extends PaymobState {}

class PaymobOrderRegistrationFailure extends PaymobState {
  final String error;
  PaymobOrderRegistrationFailure({required this.error});
}

class PaymobPaymentRequestLoading extends PaymobState {}

class PaymobPaymentRequestSuccess extends PaymobState {}

class PaymobPaymentRequestFailure extends PaymobState {
  final String error;
  PaymobPaymentRequestFailure({required this.error});
}

class RegisterLoading extends PaymobState {}

class RegisterSuccess extends PaymobState {}

class RegisterFailure extends PaymobState {}
