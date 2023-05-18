import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/core/constants.dart';

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
    double elevation = 0,
    Color textColor = Colors.white,
    Color iconColor = Colors.white,
  }) {
    return AppBar(
      centerTitle: true,
      backgroundColor: bgColor,
      elevation: elevation,
      shadowColor: greyColor,
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
    );
  }

  static Widget hint({required String text, required VoidCallback onPress}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: greyColor.withOpacity(0.4),
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
          const SizedBox(width: 10),
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            constraints: const BoxConstraints(),
            icon: const Icon(
              FontAwesomeIcons.xmark,
              color: primaryColor,
              size: 20,
            ),
            onPressed: onPress,
          )
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
