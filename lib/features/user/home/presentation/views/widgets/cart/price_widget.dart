import 'package:flutter/material.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/styles.dart';

class PriceWidget extends StatelessWidget {
  final String price;
  final int quantity;
  final Color priceColor;
  const PriceWidget(
      {Key? key,
      required this.price,
      required this.priceColor,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('E£ $price', style: Styles.title15.copyWith(color: priceColor)),
        const SizedBox(width: 4),
        Text('X $quantity', style: Styles.title13.copyWith(color: greyColor)),
      ],
    );
  }
}
