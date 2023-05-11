import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/utils/styles.dart';

class CRechText extends StatelessWidget {
  final String rich;
  final String text;
  final VoidCallback onPress;
  const CRechText(
      {Key? key, required this.rich, required this.text, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: RichText(
        text: TextSpan(
          text: rich,
          style: Styles.title13.copyWith(color: greyColor2),
          children: [
            TextSpan(
                text: text,
                style: Styles.title14.copyWith(color: primaryColor)),
          ],
        ),
      ),
    );
  }
}
