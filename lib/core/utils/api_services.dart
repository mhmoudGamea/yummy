import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/features/user/payment/data/models/paymob_model/paymob_config_model.dart';

class ApiServices {
  static late Dio _dio;
  static final _paymobConfigModel = GetIt.I.get<PaymobConfigModel>();

  static void initializeDio() {
    _dio = Dio(BaseOptions(
      baseUrl: _paymobConfigModel.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(endPoint);
    return response.data;
  }

  static Future<Map<String, dynamic>> post({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    var response = await _dio.post(endPoint, data: data);
    return response.data;
  }
}
