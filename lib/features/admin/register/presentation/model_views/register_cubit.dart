import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../data/repos/register_repo.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(RegisterInitial());

  // register admin of yummy app
  Future<void> register(
      {required BuildContext context,
      required String userName,
      required String email,
      required String password}) async {
    emit(RegisterLoading());
    final response = await _registerRepo.registerUserWithEmailPass(
        userName: userName, email: email, password: password);
    response.fold((fail) {
      emit(RegisterFailure());
      Helper.displayDialog(context, 'Registration Failed', fail.errorMessage);
    }, (success) {
      emit(RegisterSuccess());
      Helper.showCustomToast(
          context: context,
          bgColor: mintGreen,
          icon: Icons.check_circle_rounded,
          msg: success);
    });
  }
}
