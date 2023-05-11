import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils/helper.dart';
import '../utils/styles.dart';

class CTextFormField extends StatelessWidget {
  final TextInputType type;
  final bool autoFocus;
  final TextEditingController controller;
  final Function(String value) onChange;
  const CTextFormField(
      {Key? key,
      required this.type,
      this.autoFocus = false,
      required this.onChange,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: primaryColor,
      keyboardType: type,
      autofocus: autoFocus,
      maxLength: 11,
      controller: controller,
      decoration: InputDecoration(
        prefixText: '+20',
        prefixStyle: const TextStyle(color: greyColor2),
        border: Helper.border(),
        focusedBorder: Helper.border(),
        labelText: '10 digit mobile number',
        labelStyle: Styles.title14.copyWith(color: greyColor2),
        floatingLabelStyle: Styles.title14.copyWith(color: primaryColor),
      ),
      onChanged: onChange,
    );
  }
}
