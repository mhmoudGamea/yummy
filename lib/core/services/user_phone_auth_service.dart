import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/core/utils/helper.dart';

import '../../features/user/login/data/user_model.dart';
import '../../features/user/login/data/user_phone_auth_login_model.dart';
import '../error/failure.dart';

abstract class UserPhoneAuthService {
  static final FirebaseAuth _auth = GetIt.instance<FirebaseAuth>();

  static phoneAuthCredential(PhoneAuthCredential credential) async {
    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (error) {
      throw FireStoreSideError.fromCredential(error.code);
    }
  }

  static phoneAuthFailed(FirebaseAuthException error) {
    throw FireStoreSideError.fromFailed(error.code);
  }

  static Future<Either<Failure, UserModel>> codeSent(BuildContext context,
      UserPhoneAuthLoginModel userPhoneAuthLoginModel) async {
    final Completer<void> completer = Completer<void>();
    // 2- This will store the OTP entered by the user
    String smsText = '';
    // 3- Callback function to handle the OTP input
    void handleSmsOtp(String text) {
      smsText = text;
      if (smsText.length == 6) {
        completer.complete();
      }
    }

    // 4- Show the OTP input dialog to the user
    Helper.openSmsOtpDialog(context, handleSmsOtp);

    await completer.future;

    // 5- Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: userPhoneAuthLoginModel.verificationId,
      smsCode: smsText,
    );

    // 6- Sign the user in (or link) with the credential
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        log('Success to sign in user');
        UserModel userModel = UserModel(
          uid: userCredential.user!.uid,
          phoneNumber: userCredential.user!.phoneNumber!,
        );
        return right(userModel);
      } else {
        log('Error in UserPhoneAuthService: codeSent');
        return left(FireStoreSideError('OTP code that you entered is wrong'));
      }
    } catch (e) {
      log('Exception: $e');
      return left(FireStoreSideError('An error occurred during sign-in'));
    }
  }

  static codeAutoRetrievalTimeout(String verificationId) {
    // Auto-resolution timed out...
  }
}
