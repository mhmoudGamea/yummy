import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/firestore_services.dart';
import 'package:yummy/core/utils/helper.dart';
import 'package:yummy/core/widgets/tabs_view.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/c_text_button.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final FirebaseAuth _auth = GetIt.I.get<FirebaseAuth>();
  final FirestoreServices _services = GetIt.I.get<FirestoreServices>();

  late String myVerificationId;
  late String smsOtp;
  var error = '';

  Future<void> openSmsOtpDialog(
      BuildContext context,
      String number,
      verifyId,
      double? latitude,
      double? longitude,
      String? address,
      String? administrativeArea) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          children: const [
            Text('Verification Code', style: Styles.title16),
            SizedBox(height: 10),
            Text(
              'Enter 6 numbers received as SMS',
              style: Styles.title14,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: SizedBox(
          height: 50,
          child: TextField(
            textAlign: TextAlign.center,
            autofocus: true,
            maxLength: 6,
            keyboardType: TextInputType.number,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              border: Helper.border(),
              focusedBorder: Helper.border(),
            ),
            onChanged: (value) {
              smsOtp = value;
            },
          ),
        ),
        actions: [
          CTextButton(
            align: Alignment.bottomRight,
            text: 'Done',
            textColor: babyBlue,
            onPress: () async {
              // Create a PhoneAuthCredential with the code
              try {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: verifyId,
                  smsCode: smsOtp,
                );
                // Sign the user in (or link) with the credential
                final User? user =
                    (await _auth.signInWithCredential(credential)).user;

                if (user != null) {
                  emit(LoginSuccess());
                  // ignore: use_build_context_synchronously
                  Helper.showCustomToast(
                      context: context,
                      bgColor: mintGreen,
                      icon: Icons.check_circle_outline_rounded,
                      msg: 'Successfully loged in.');
                  // navigate to home page if login success
                  Navigator.of(context).pop();
                  GoRouter.of(context).pushReplacement(TabsView.rn);

                  if (address != null &&
                      latitude != null &&
                      longitude != null &&
                      administrativeArea != null) {
                    _services.createUser(coll: 'users', values: {
                      'id': user.uid,
                      'phoneNumber': user.phoneNumber,
                      'latitude': latitude,
                      'longitude': longitude,
                      'address': address,
                      'administrativeArea': administrativeArea,
                    });
                  }
                } else {
                  print('Failed to go to home page');
                }
              } catch (e) {
                emit(InvalidOTP());
                error = 'Invalid OTP';
                print(e.toString());
                Navigator.of(context).pop();
                // to close keyboard
                FocusManager.instance.primaryFocus!.unfocus();
                Helper.showCustomToast(
                    context: context,
                    bgColor: secondaryColor,
                    icon: Icons.cancel_outlined,
                    msg:
                        'The verification code from is invalid. Please check and enter the correct code again.');
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> signinUserWithPhoneNumber({
    required BuildContext context,
    required String number,
    double? latitude,
    double? longitude,
    String? address,
    String? administrativeArea,
  }) async {
    emit(LoginLoading());
    credintial(PhoneAuthCredential credential) async {
      try {
        await _auth.signInWithCredential(credential);
      } on FirebaseAuthException catch (error) {
        return FireStoreSideError.fromCredential(error.code);
      }
    }

    failed(FirebaseAuthException error) {
      return FireStoreSideError.fromFailed(error.code);
    }

    code(String verificationId, int? resendToken) async {
      myVerificationId = verificationId;
      // Update the UI - wait for the user to enter the SMS code
      await openSmsOtpDialog(context, number, verificationId, latitude,
          longitude, address, administrativeArea);
    }

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: credintial,
        verificationFailed: failed,
        codeSent: code,
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (verificationId) {
          myVerificationId = verificationId;
        },
      );
    } catch (error) {
      emit(LoginFailed());
      Helper.showCustomToast(
          context: context,
          bgColor: secondaryColor,
          icon: Icons.cancel_outlined,
          msg: 'Failed to login.');
      print(error.toString());
    }
  }
}
