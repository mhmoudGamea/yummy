import 'package:flutter/material.dart';
import 'package:yummy/core/constants.dart';

import '../../../../../../core/utils/styles.dart';

class CHeader extends StatelessWidget {
  final String headerName;
  const CHeader({super.key, required this.headerName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          headerName,
          style: Styles.title15
              .copyWith(fontWeight: FontWeight.bold, letterSpacing: .9),
          textAlign: TextAlign.start,
        ),
        const Spacer(),
        Text(
          'See more',
          style: Styles.title13.copyWith(
              letterSpacing: .1,
              fontWeight: FontWeight.w400,
              color: primaryColor),
        ),
      ],
    );
  }
}
