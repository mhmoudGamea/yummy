import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy/features/user/home/presentation/model_views/cart_cubit/cart_cubit.dart';
import 'package:yummy/features/user/home/presentation/views/widgets/cart/cart_view_body.dart';

import '../../../../../core/utils/helper.dart';

class CartView extends StatelessWidget {
  static const String rn = '/cartView';
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        appBar: Helper.appBar(
          context: context,
          text: 'Cart',
          bgColor: Colors.white,
          textColor: Colors.black,
          leading: true,
          elevation: 2,
          iconColor: Colors.black,
        ),
        body: const SafeArea(
          child: CartViewBody(),
        ),
      ),
    );
  }
}
