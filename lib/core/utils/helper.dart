import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/features/user/chat/presentation/views/chat_video_view.dart';

import '../config/app_colors.dart';
import '../widgets/c_text_button.dart';
import 'styles.dart';

class Helper {
  static InputBorder border({Color? borderColor}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: borderColor ?? Colors.black,
      ),
    );
  }

  static Container dismissBackGround({double? radius}) {
    return Container(
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 0),
        color: Colors.red,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: const Icon(
        FontAwesomeIcons.trash,
        size: 18,
        color: Colors.white,
      ),
    );
  }

  // this appbar is used in loging and registration
  static AppBar appBar({
    required BuildContext context,
    required String text,
    required Color bgColor,
    bool leading = true,
    bool trailing = false,
    double elevation = 0,
    Color textColor = Colors.white,
    Color iconColor = Colors.white,
  }) {
    return AppBar(
      centerTitle: true,
      backgroundColor: bgColor,
      elevation: elevation,
      shadowColor: AppColors.greyColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.black,
        statusBarIconBrightness: Brightness.light,
      ),
      surfaceTintColor: Colors.transparent,
      leading: leading
          ? TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: iconColor,
                size: 20,
              ),
            )
          : null,
      title: Text(
        text,
        style: Styles.title15.copyWith(color: textColor, letterSpacing: 0.4),
      ),
      actions: trailing
          ? [
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(ChatVideoView.rn);
                },
                child: Icon(
                  FontAwesomeIcons.video,
                  color: iconColor,
                  size: 20,
                ),
              ),
            ]
          : null,
    );
  }

  static Widget hint({required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.greyColor.withAlpha((0.7 * 255).toInt()),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/splash.png', width: 30, height: 30),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              text,
              style: Styles.title14,
            ),
          ),
        ],
      ),
    );
  }

  static void showCustomToast({
    required BuildContext context,
    required Color bgColor,
    required IconData icon,
    required String msg,
  }) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: bgColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 18,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                msg,
                style: Styles.title14.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
    fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
      fadeDuration: const Duration(milliseconds: 500),
      gravity: ToastGravity.BOTTOM,
    );
  }

  static Future<void> displayDialog(
      BuildContext context, String title, String content) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: Styles.title15),
          content: Text(content,
              style: Styles.title14
                  .copyWith(color: AppColors.greyColor2, letterSpacing: 1)),
          actions: [
            CTextButton(
              text: 'Ok',
              onPress: () {
                GoRouter.of(context).pop();
              },
              align: Alignment.bottomRight,
              textColor: AppColors.babyBlue,
            )
          ],
        );
      },
    );
  }

  // this dialog used to make user enter his otp code to login
  static openSmsOtpDialog(
    BuildContext context,
    Function(String) smsOtp,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          children: [
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
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              border: border(borderColor: AppColors.primaryColor),
              focusedBorder: border(borderColor: AppColors.primaryColor),
            ),
            onChanged: (value) {
              smsOtp(value);
            },
          ),
        ),
      ),
    );
  }
}
