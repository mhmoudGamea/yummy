import 'package:flutter/material.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/styles.dart';

import '../../../../../../core/utils/helper.dart';

class CSearchField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPress;
  const CSearchField(
      {super.key, required this.controller, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: black,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: const Icon(Icons.search_rounded, size: 25, color: black),
          onPressed: onPress,
        ),
        hintText: 'Search',
        hintStyle: Styles.title14,
        filled: true,
        fillColor: greyColor.withOpacity(0.2),
        border: Helper.border(),
        focusedBorder: Helper.border(),
        enabledBorder: Helper.border(),
      ),
    );
  }
}
