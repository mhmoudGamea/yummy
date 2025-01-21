import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../utils/helper.dart';
import '../utils/styles.dart';

class CTextFormField extends StatelessWidget {
  final TextInputType type;
  final bool autoFocus;
  final TextEditingController controller;
  final Function(String value) onChange;
  const CTextFormField(
      {super.key,
      required this.type,
      this.autoFocus = false,
      required this.onChange,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      keyboardType: type,
      autofocus: autoFocus,
      maxLength: 11,
      controller: controller,
      decoration: InputDecoration(
        prefixText: '+20',
        prefixStyle: TextStyle(color: AppColors.greyColor2),
        border: Helper.border(),
        focusedBorder: Helper.border(),
        labelText: '10 digit mobile number',
        labelStyle: Styles.title14.copyWith(color: AppColors.greyColor2),
        floatingLabelStyle:
            Styles.title14.copyWith(color: AppColors.primaryColor),
      ),
      onChanged: onChange,
    );
  }
}
