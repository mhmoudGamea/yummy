import 'package:flutter/material.dart';

import '../../../../../../../core/config/app_colors.dart';
import '../../../../../../../core/utils/helper.dart';
import '../../../../../../../core/utils/styles.dart';

class EditTextField extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextInputType type;
  final TextEditingController controller;
  final String? Function(String? value) validator;
  const EditTextField({
    super.key,
    required this.icon,
    required this.label,
    required this.type,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      cursorColor: AppColors.primaryColor,
      keyboardType: type,
      controller: controller,
      // initialValue: 'hello world',
      decoration: InputDecoration(
        helperStyle: Styles.title12.copyWith(color: AppColors.greyColor2),
        prefixIcon: Icon(
          icon,
          size: 20,
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
