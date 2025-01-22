// class UserInfoModel {
//   final String id;
//   final String phoneNumber;
//   final double? latitude;
//   final double? longitude;
//   final String? address;
//   final String? administrativeArea;
//   final String? profileImage;
//   final String? name;
//   final String? email;

//   const UserInfoModel({
//     required this.id,
//     required this.phoneNumber,
//     required this.latitude,
//     required this.longitude,
//     required this.address,
//     required this.administrativeArea,
//     this.profileImage,
//     this.name,
//     this.email,
//   });

//   factory UserInfoModel.fromJson(Map<String, dynamic> json) {
//     return UserInfoModel(
//       id: json['id'],
//       phoneNumber: json['phoneNumber'],
//       latitude: json['latitude'],
//       longitude: json['longitude'],
//       address: json['address'],
//       administrativeArea: json['administrativeArea'],
//       profileImage: json['profileImage'],
//       name: json['name'],
//       email: json['email'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'phoneNumber': phoneNumber,
//       'latitude': latitude,
//       'longitude': longitude,
//       'address': address,
//       'administrativeArea': administrativeArea,
//       'profileImage': profileImage,
//       'name': name,
//       'email': email,
//     };
//   }
// }
