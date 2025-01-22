import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yummy/core/error/failure.dart';
import 'package:yummy/core/utils/api_services.dart';
import 'package:yummy/features/user/payment/domain/repos/paymob_repo.dart';

import '../../../data/models/paymob_model/paymob_config_model.dart';
import '../../../data/models/paymob_model/paymob_user_info.dart';

class PaymobRepoImpl extends PaymobRepo {
  @override
  Future<Either<Failure, Map<String, dynamic>>> getAuthenticationRequest(
      {required String endPoint, required String apiKey}) async {
    try {
      final response =
          await ApiServices.post(endPoint: endPoint, data: {"api_key": apiKey});
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getOrderRegistration(
      {required String endPoint,
      required String token,
      required String totalPrice}) async {
    try {
      final response = await ApiServices.post(endPoint: endPoint, data: {
        "auth_token": token,
        "delivery_needed": "false",
        "amount_cents": totalPrice,
        "currency": "EGP",
        "items": [],
      });
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getPaymentRequest(
      {required PaymobConfigModel paymobConfigModel,
      required PaymobUserInfo paymobUserInfo,
      required String totalPrice}) async {
    try {
      final response = await ApiServices.post(
          endPoint: paymobConfigModel.paymentRequest,
          data: {
            "auth_token": paymobConfigModel.firstToken,
            "amount_cents": totalPrice,
            "expiration": 3600,
            "order_id": paymobConfigModel.orderId,
            "billing_data": {
              "apartment": "NA",
              "email": paymobUserInfo.email,
              "floor": "NA",
              "first_name": paymobUserInfo.firstName,
              "street": "NA",
              "building": "NA",
              "phone_number": paymobUserInfo.phone,
              "shipping_method": "NA",
              "postal_code": "NA",
              "city": "NA",
              "country": "NA",
              "last_name": paymobUserInfo.lastName,
              "state": "NA"
            },
            "currency": "EGP",
            "integration_id": paymobConfigModel.integrationOnlineCard,
            "lock_order_when_paid": "false"
          });
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerSideError.fromDioError(error));
      }
      return left(ServerSideError(error.toString()));
    }
  }
}
