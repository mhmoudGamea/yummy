//TODO: you have a login model and user info model and this is a problem
//TODO: delete this and use user info model instead
class LoginModel {
  final String id;
  final String phoneNumber;

  const LoginModel({required this.id, required this.phoneNumber});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
    };
  }
}
