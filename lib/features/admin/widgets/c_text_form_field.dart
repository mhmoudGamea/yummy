import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils/helper.dart';
import '../../../core/utils/styles.dart';

class CTextFormField extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextInputType type;
  final TextEditingController controller;
  final bool hidden;
  final String? helper;
  final String? Function(String? value) validator;
  const CTextFormField(
      {super.key,
      required this.label,
      required this.type,
      required this.controller,
      this.hidden = false,
      required this.icon,
      this.helper,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      cursorColor: AppColors.primaryColor,
      keyboardType: type,
      controller: controller,
      obscureText: hidden,
      decoration: InputDecoration(
        helperText: helper,
        helperStyle: Styles.title12.copyWith(color: AppColors.greyColor2),
        prefixIcon: Icon(
          icon,
          size: 15,
        ),
        prefixIconColor: AppColors.primaryColor,
        prefixStyle: TextStyle(color: AppColors.greyColor2),
        border: Helper.border(),
        focusedBorder: Helper.border(borderColor: AppColors.primaryColor),
        labelText: label,
        labelStyle: Styles.title14.copyWith(color: AppColors.greyColor2),
        floatingLabelStyle:
            Styles.title14.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
