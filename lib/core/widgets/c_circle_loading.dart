import 'package:flutter/material.dart';

import '../constants.dart';

class CCircleLoading extends StatelessWidget {
  const CCircleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: const CircularProgressIndicator(
          color: primaryColor, strokeWidth: 3, backgroundColor: greyColor),
    );
  }
}
