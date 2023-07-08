import 'package:flutter/material.dart';

import '../../../../../../../core/utils/styles.dart';

class CIconButton extends StatelessWidget {
  final Color bgColor;
  final Color iconColor;
  final String text;
  final Color textColor;
  const CIconButton(
      {Key? key,
      required this.bgColor,
      required this.iconColor,
      required this.text,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/cart.png', width: 20, color: Colors.white),
          const SizedBox(width: 15),
          Text(
            text,
            style: Styles.title15.copyWith(color: textColor),
          )
        ],
      ),
    );
  }
}
