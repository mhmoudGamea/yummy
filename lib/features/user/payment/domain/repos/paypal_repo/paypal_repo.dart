import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:yummy/core/error/failure.dart';

import '../../paypal_entity/order_entity.dart';

abstract class PaypalRepo {
  Future<Either<Failure, void>> paymentWithPaypal(
      BuildContext context, OrderEntity orderEntity);
}
