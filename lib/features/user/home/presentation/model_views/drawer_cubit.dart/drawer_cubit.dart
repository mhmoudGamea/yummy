import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummy/core/services/user_service.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/user_model.dart';
import '../../../../../welcome/presentation/views/welcome_view.dart';
import 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit(this._userService) : super(DrawerInitial());
  final UserService _userService;

  late UserModel _userModel;

  UserModel get getUserModel {
    return _userModel;
  }

  Future<void> getUserProfileData() async {
    try {
      emit(UserDataLoading());
      final result = await _userService.getUserProfileData();
      _userModel = UserModel.fromJson(result);
      emit(UserDataSuccess());
    } on FireStoreSideError catch (error) {
      log(error.errorMessage);
      emit(UserDataFailure(error.errorMessage));
    }
  }

  Future<void> logOut(BuildContext context) async {
    FirebaseAuth.instance.signOut();
    GoRouter.of(context).push(WelcomeView.rn);
    SharedPreferences prefs = GetIt.instance<SharedPreferences>();
    await prefs.clear();
  }
}
