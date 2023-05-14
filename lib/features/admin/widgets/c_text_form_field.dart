import 'package:flutter/material.dart';

import '../../../core/constants.dart';
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
      {Key? key,
      required this.label,
      required this.type,
      required this.controller,
      this.hidden = false,
      required this.icon,
      this.helper,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      cursorColor: primaryColor,
      keyboardType: type,
      controller: controller,
      obscureText: hidden,
      decoration: InputDecoration(
        helperText: helper,
        helperStyle: Styles.title12.copyWith(color: greyColor2),
        prefixIcon: Icon(
          icon,
          size: 15,
        ),
        prefixIconColor: primaryColor,
        prefixStyle: const TextStyle(color: greyColor2),
        border: Helper.border(),
        focusedBorder: Helper.border(borderColor: primaryColor),
        labelText: label,
        labelStyle: Styles.title14.copyWith(color: greyColor2),
        floatingLabelStyle: Styles.title14.copyWith(color: primaryColor),
      ),
    );
  }
}
