import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/core/widgets/c_circle_loading.dart';
import 'package:yummy/features/user/home/presentation/model_views/cart_cubit/cart_cubit.dart';

import '../../../../../../../core/constants.dart';
import '../../../../../../../core/utils/helper.dart';
import '../../../../../../../core/utils/styles.dart';

class CFixedButton extends StatelessWidget {
  final String price;
  final String text;
  final Color bgColor;
  final Color textColor;
  final Color iconColor;
  final VoidCallback onPress;

  const CFixedButton(
      {Key? key,
      required this.price,
      required this.bgColor,
      required this.textColor,
      required this.iconColor,
      required this.text,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
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
            child: GestureDetector(
              onTap: onPress,
              child: BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {
                  if (state is AddToCartLoading) {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            const Center(child: CCircleLoading()));
                  } else if (state is AddToCartSuccess) {
                    GoRouter.of(context).pop();
                    Helper.showCustomToast(
                        context: context,
                        bgColor: mintGreen,
                        icon: FontAwesomeIcons.check,
                        msg: 'Added to cart');
                  } else if (state is AddToCartSuccessWithIncreaseQuantity) {
                    GoRouter.of(context).pop();
                    Helper.showCustomToast(
                        context: context,
                        bgColor: mintGreen,
                        icon: FontAwesomeIcons.check,
                        msg: 'Quantity of product has been increased');
                  }
                },
                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: bgColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/cart.png',
                            width: 20, color: Colors.white),
                        const SizedBox(width: 15),
                        Text(
                          text,
                          style: Styles.title15.copyWith(color: textColor),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
