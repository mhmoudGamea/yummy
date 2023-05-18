import 'package:flutter/material.dart';

import 'text_13.dart';

class CItemRate extends StatelessWidget {
  final String rate;
  final Color rateColor;
  const CItemRate({Key? key, required this.rate, required this.rateColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star_rounded, color: Colors.amber, size: 17),
        const SizedBox(width: 4),
        Text13(text: rate, color: rateColor),
      ],
    );
  }
}
