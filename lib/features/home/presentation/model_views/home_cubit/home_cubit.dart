import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../../data/data/user_info_model.dart';
import '../../../data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitial());

  late UserInfoModel _userInfoModel;

  UserInfoModel get getUserInfoModel {
    return _userInfoModel;
  }

  Future<void> getUserData(BuildContext context) async {
    emit(UserInfoLoading());
    final response = await _homeRepo.getUserInformation();
    response.fold((failure) {
      emit(UserInfoFailure());
      Helper.showCustomToast(
          context: context,
          bgColor: secondaryColor,
          icon: Icons.close_rounded,
          msg: failure.errorMessage);
    }, (userInfoModel) {
      _userInfoModel = userInfoModel;
      emit(UserInfoSuccess(
          administrativeArea: userInfoModel.administrativeArea));
    });
  }
}
