abstract class PaypalState {}

class PaypalInitial extends PaypalState {}

// address
class AddressLoading extends PaypalState {}

class AddressSuccess extends PaypalState {
  final String country;
  final String state;
  final String city;
  final String street;
  final String zip;

  AddressSuccess(
      {required this.country,
      required this.state,
      required this.city,
      required this.street,
      required this.zip});
}

class AddressError extends PaypalState {}

// paypal
class PaypalLoading extends PaypalState {}

class PaypalSuccess extends PaypalState {}

class PaypalError extends PaypalState {}
