import 'package:flutter/material.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/styles.dart';

class CItemCategory extends StatelessWidget {
  final String categoryName;
  const CItemCategory({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/categories/$categoryName.png',
            width: 25, height: 25),
        const SizedBox(width: 8),
        Text(
          categoryName,
          style: Styles.title14.copyWith(color: primaryColor),
        ),
      ],
    );
  }
}
