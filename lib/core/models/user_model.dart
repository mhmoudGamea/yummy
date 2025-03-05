class UserModel {
  final String uid;
  final String phoneNumber;
  String? name;
  String? email;
  num? latitude;
  num? longitude;
  String? address;
  String? administrativeArea;
  String? profileImage;

  UserModel({
    required this.uid,
    required this.phoneNumber,
    this.latitude,
    this.longitude,
    this.address,
    this.administrativeArea,
    this.name,
    this.email,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      phoneNumber: json['phoneNumber'],
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
      address: json['address'] ?? '',
      administrativeArea: json['administrativeArea'] ?? '',
      profileImage: json['profileImage'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'phoneNumber': phoneNumber,
      'latitude': latitude ?? 0.0,
      'longitude': longitude ?? 0.0,
      'address': address ?? '',
      'administrativeArea': administrativeArea ?? '',
      'name': name ?? '',
      'email': email ?? '',
      'profileImage': profileImage ?? '',
    };
  }
}
