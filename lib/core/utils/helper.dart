import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/core/constants.dart';

import '../widgets/c_text_button.dart';
import 'styles.dart';

class Helper {
  static InputBorder border() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: black,
      ),
    );
  }

  // this appbar is used in loging and registration
  static AppBar appBar({
    required BuildContext context,
    required String text,
    required Color bgColor,
    Color textColor = Colors.white,
    Color iconColor = Colors.white,
  }) {
    return AppBar(
      centerTitle: true,
      backgroundColor: bgColor,
      elevation: 0,
      leading: TextButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
          size: 20,
        ),
      ),
      title: Text(
        text,
        style: Styles.title15.copyWith(color: textColor, letterSpacing: 0.4),
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
              style:
                  Styles.title14.copyWith(color: greyColor2, letterSpacing: 1)),
          actions: [
            CTextButton(
              text: 'Ok',
              onPress: () {
                GoRouter.of(context).pop();
              },
              align: Alignment.bottomRight,
              textColor: babyBlue,
            )
          ],
        );
      },
    );
  }
}
