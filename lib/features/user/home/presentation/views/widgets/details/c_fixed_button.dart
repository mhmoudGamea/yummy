import 'package:flutter/material.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/details/c_icon_button.dart';

import '../../../../../../../core/constants.dart';
import '../../../../../../../core/utils/styles.dart';

class CFixedButton extends StatelessWidget {
  final String price;
  final String text;
  final Color bgColor;
  final Color textColor;
  final Color iconColor;
  const CFixedButton(
      {Key? key,
      required this.price,
      required this.bgColor,
      required this.textColor,
      required this.iconColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Price',
                style: Styles.title14.copyWith(color: greyColor),
              ),
              const SizedBox(height: 5),
              Text(
                'E£ $price',
                style: Styles.title16.copyWith(color: primaryColor),
              ),
            ],
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.22),
          Expanded(
            child: CIconButton(
                bgColor: bgColor,
                iconColor: iconColor,
                text: text,
                textColor: textColor),
          ),
        ],
      ),
    );
  }
}
