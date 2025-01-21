import 'package:flutter/material.dart';
import 'package:yummy/core/utils/styles.dart';

import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/utils/helper.dart';

class CSearchField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPress;
  const CSearchField(
      {super.key, required this.controller, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.black,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.search_rounded, size: 25, color: AppColors.black),
          onPressed: onPress,
        ),
        hintText: 'Search',
        hintStyle: Styles.title14,
        filled: true,
        fillColor: AppColors.greyColor.withAlpha((0.2 * 255).toInt()),
        border: Helper.border(),
        focusedBorder: Helper.border(),
        enabledBorder: Helper.border(),
      ),
    );
  }
}
