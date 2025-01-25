import '../../domain/paypal_entity/address_entity.dart';

class AddressModel {
  String name;
  String street;
  String city;
  String state;
  String country;
  String zip;
  String email;

  AddressModel({
    required this.name,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.zip,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'zip': zip,
      'email': email,
    };
  }

  factory AddressModel.fromAddressEntity(AddressEntity entity) {
    return AddressModel(
      name: entity.name,
      street: entity.street,
      city: entity.city,
      state: entity.state,
      country: entity.country,
      zip: entity.zip,
      email: entity.email,
    );
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      name: json['name'],
      street: json['street'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      zip: json['zip'],
      email: json['email'],
    );
  }

  static AddressEntity toAddressEntity(AddressModel addressModel) {
    return AddressEntity(
      name: addressModel.name,
      street: addressModel.street,
      city: addressModel.city,
      state: addressModel.state,
      country: addressModel.country,
      zip: addressModel.zip,
      email: addressModel.email,
    );
  }
}
