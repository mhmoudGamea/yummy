import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/features/user/payment/data/models/paymob_model/paymob_config_model.dart';
import 'package:yummy/features/user/payment/data/models/paymob_model/paymob_user_info.dart';
import 'package:yummy/features/user/payment/domain/repos/paymob_repo/paymob_repo.dart';

part 'paymob_state.dart';

class PaymobCubit extends Cubit<PaymobState> {
  final PaymobRepo _paymobRepo;
  final PaymobConfigModel _paymobConfigModel = GetIt.I.get<PaymobConfigModel>();

  PaymobCubit(this._paymobRepo) : super(PaymobInitial());

  // this is the first method in paymob you just send your api_key and get a token
  // after this i will store this token in my .json file
  Future<void> authenticationRequest() async {
    emit(PaymobAuthenticationLoading());
    final response = await _paymobRepo.getAuthenticationRequest(
        endPoint: _paymobConfigModel.authenticationRequest,
        apiKey: _paymobConfigModel.apiKey);
    response.fold((fail) {
      print(fail.errorMessage);
      emit(PaymobAuthenticationFailure(error: fail.errorMessage));
    }, (response) async {
      // save the token in my PaymobConfigModel
      emit(PaymobAuthenticationSuccess());

      _paymobConfigModel.firstToken = response['token'];
      print(_paymobConfigModel.firstToken);
    });
  }

  //second method in paymob is to have the orderId by register your order in paymob
  //in this function you should pass totalPrice of the order and token from previous func
  Future<void> orderRegistration({required String totalPrice}) async {
    print(totalPrice);
    emit(PaymobOrderRegistrationLoading());
    final response = await _paymobRepo.getOrderRegistration(
        endPoint: _paymobConfigModel.orderRegistration,
        token: _paymobConfigModel.firstToken!,
        totalPrice: totalPrice);
    response.fold((fail) {
      emit(PaymobOrderRegistrationFailure(error: fail.errorMessage));
    }, (response) async {
      // save the order id in my PaymobConfigModel
      emit(PaymobOrderRegistrationSuccess());
      print('succcccccccccccccccccccccccccccccccccccccess');
      _paymobConfigModel.orderId = response['id'].toString();
      print(_paymobConfigModel.orderId);
    });
  }

  // last method is to pay for your order. so in this function you should pass the token and
  // total price of this order and the id of this order that you get from the 2th method
  Future<void> paymobPaymentRequest(
      {required String totalPrice,
      required PaymobUserInfo paymobUserInfo}) async {
    emit(PaymobPaymentRequestLoading());
    final response = await _paymobRepo.getPaymentRequest(
        paymobConfigModel: _paymobConfigModel,
        paymobUserInfo: paymobUserInfo,
        totalPrice: totalPrice);
    response.fold((fail) {
      emit(PaymobPaymentRequestFailure(error: fail.errorMessage));
    }, (response) async {
      // save the order id in my PaymobConfigModel
      emit(PaymobPaymentRequestSuccess());
      _paymobConfigModel.finalToken = response['token'];
      print('final token finally: ${_paymobConfigModel.finalToken}');
    });
  }

  void registerForPaymobPayment(
      {required String totalPrice,
      required PaymobUserInfo paymobUserInfo}) async {
    emit(RegisterLoading());
    try {
      await orderRegistration(totalPrice: totalPrice);
      await paymobPaymentRequest(
          totalPrice: totalPrice, paymobUserInfo: paymobUserInfo);
      emit(RegisterSuccess());
    } catch (error) {
      emit(RegisterFailure());
    }
  }
}
