import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/utils/helper.dart';
import '../../../admin_home/presentation/views/admin_home_view.dart';
import '../../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());

  // login admin of yummy app
  Future<void> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    emit(LoginLoading());
    final response = await _loginRepo.loginUserWithEmailPass(
        email: email, password: password);
    response.fold((fail) {
      emit(LoginFailure());
      Helper.displayDialog(context, 'Loging Failed', fail.errorMessage);
    }, (success) {
      emit(LoginSuccess());
      Helper.showCustomToast(
          context: context,
          bgColor: AppColors.mintGreen,
          icon: Icons.check_circle_rounded,
          msg: success);
      GoRouter.of(context).push(AdminHomeView.rn);
    });
  }
}
