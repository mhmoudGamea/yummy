import 'package:dartz/dartz.dart';
import 'package:yummy/core/error/failure.dart';
import 'package:yummy/features/user/payment/data/paymob_model/paymob_config_model.dart';
import 'package:yummy/features/user/payment/data/paymob_model/paymob_user_info.dart';

abstract class PaymobRepo {
  Future<Either<Failure, Map<String, dynamic>>> getAuthenticationRequest(
      {required String endPoint, required String apiKey});
  Future<Either<Failure, Map<String, dynamic>>> getOrderRegistration(
      {required String endPoint,
      required String token,
      required String totalPrice});
  Future<Either<Failure, Map<String, dynamic>>> getPaymentRequest(
      {required PaymobConfigModel paymobConfigModel,
      required PaymobUserInfo paymobUserInfo,
      required String totalPrice});
}
