class UserPhoneAuthLoginModel {
  final String phoneNumber;
  final String verificationId;
  final int? resendToken;

  UserPhoneAuthLoginModel({
    required this.phoneNumber,
    required this.verificationId,
    this.resendToken,
  });
}
