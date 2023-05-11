class LoginModel {
  final String userName;
  final String email;
  final String password;
  final String uid;

  const LoginModel(
      {required this.userName,
      required this.email,
      required this.password,
      required this.uid});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        userName: json['userName'],
        email: json['email'],
        password: json['password'],
        uid: json['uid']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
      'uid': uid,
    };
  }
}
