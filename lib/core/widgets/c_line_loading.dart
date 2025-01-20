import 'package:flutter/material.dart';

import '../constants.dart';

class CLineLoading extends StatelessWidget {
  const CLineLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: const LinearProgressIndicator(
          color: primaryColor, minHeight: 3, backgroundColor: greyColor),
    );
  }
}
