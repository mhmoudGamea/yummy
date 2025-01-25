class AddressEntity {
  final String name;
  final String street;
  final String city;
  final String state;
  final String country;
  final String zip;
  final String email;

  AddressEntity({
    required this.name,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.zip,
    required this.email,
  });

  @override
  String toString() {
    return 'AddressEntity(name: $name, street: $street, city: $city, state: $state, country: $country, zip: $zip, email: $email)';
  }
}
