import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/cache_helper.dart';
import 'package:yummy/core/widgets/tabs_view.dart';

import '../../../../../../core/services/user_phone_auth_service.dart';
import '../../../../../../core/utils/firestore_services.dart';
import '../../../data/user_phone_auth_login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final FirebaseAuth _auth = GetIt.I.get<FirebaseAuth>();

  Future<void> signinUserWithPhoneNumber({
    required BuildContext context,
    required String number,
  }) async {
    emit(LoginLoading());
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: UserPhoneAuthService.phoneAuthCredential,
        verificationFailed: UserPhoneAuthService.phoneAuthFailed,
        codeSent: (String verificationId, int? resendToken) async {
          // 1- create user phone auth model
          final UserPhoneAuthLoginModel userPhoneAuthLoginModel =
              UserPhoneAuthLoginModel(
            phoneNumber: number,
            verificationId: verificationId,
            resendToken: resendToken,
          );
          final result = await UserPhoneAuthService.codeSent(
            context,
            userPhoneAuthLoginModel,
          );
          result.fold((error) {
            emit(LoginFailed());
          }, (success) async {
            emit(LoginSuccess());
            GoRouter.of(context).pushReplacement(TabsView.rn);
            // TODO: create users collection to save user data
            final FirestoreServices services = GetIt.I.get<FirestoreServices>();
            await services.createUser(
                coll: kUsersCollection, values: success.toMap());
            // TODO: save user data in shared preferences
            CacheHelper.saveData(key: kUid, value: success.uid);
            CacheHelper.saveData(key: kPhoneNumber, value: success.phoneNumber);
          });
        },
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: UserPhoneAuthService.codeAutoRetrievalTimeout,
      );
    } catch (error) {
      emit(LoginFailed());
    }
  }
}
