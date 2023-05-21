import 'package:flutter/material.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/styles.dart';

import '../../../../../../core/utils/helper.dart';

class CSearchField extends StatelessWidget {
  const CSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: black,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search_rounded, size: 25, color: black),
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
