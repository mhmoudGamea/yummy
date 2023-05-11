class LocationModel {
  double latitude;
  double longitude;
  String? address;
  String? administrativeArea;

  LocationModel(
      {required this.latitude,
      required this.longitude,
      this.address,
      this.administrativeArea});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        latitude: json['latitude'],
        longitude: json['longitude'],
        address: json['address'],
        administrativeArea: json['administrativeArea']);
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'administrativeArea': administrativeArea,
    };
  }
}
