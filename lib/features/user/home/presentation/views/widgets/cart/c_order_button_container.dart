import 'package:flutter/material.dart';
import '../../../../../../../core/config/app_colors.dart';
import 'c_order_button.dart';
import 'c_order_total.dart';

class COrderButtonContainer extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String text;
  const COrderButtonContainer({
    super.key,
    required this.bgColor,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor.withAlpha((0.4 * 255).toInt()),
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          COrderTotal(),
          SizedBox(width: MediaQuery.of(context).size.width * 0.22),
          COrderButton(bgColor: bgColor, text: text, textColor: textColor),
        ],
      ),
    );
  }
}
