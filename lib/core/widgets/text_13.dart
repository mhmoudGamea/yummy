import 'package:flutter/material.dart';

import '../utils/styles.dart';

class Text13 extends StatelessWidget {
  final String text;
  final Color color;
  const Text13({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.title13.copyWith(color: color),
    );
  }
}
