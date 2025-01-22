class UserModel {
  final String uid;
  final String phoneNumber;
  String? name;
  String? email;
  double? latitude;
  double? longitude;
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
