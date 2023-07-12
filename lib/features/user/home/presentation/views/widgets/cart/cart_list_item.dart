import 'package:flutter/material.dart';
import 'package:yummy/core/widgets/c_item_image.dart';
import 'package:yummy/features/user/home/data/data/cart_model.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/cart/price_widget.dart';

import '../../../../../../../core/constants.dart';
import '../../../../../favourite/presentation/views/widgets/c_item_category.dart';
import '../../../../../favourite/presentation/views/widgets/c_item_name.dart';

class CartListItem extends StatelessWidget {
  final CartModel cartModel;
  const CartListItem({Key? key, required this.cartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.6),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0.1, 0.1),
          ),
        ],
      ),
      child: Row(
        children: [
          CItemImage(image: cartModel.productImage),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CItemCategory(categoryName: cartModel.productCategory),
              const SizedBox(height: 2),
              CItemName(text: cartModel.productName),
              const SizedBox(height: 8),
              // CItemRate(rate: widget.model.rate, rateColor: Colors.black)
              PriceWidget(
                price: cartModel.productPrice,
                priceColor: secondaryColor,
                quantity: cartModel.productQuantity,
              )
            ],
          ),
        ],
      ),
    );
  }
}
