import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/features/user/payment/data/paypal_model/config_model.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/services/paypal_service.dart';
import '../../paypal_entity/order_entity.dart';
import 'paypal_repo.dart';

class PaypalRepoImpl implements PaypalRepo {
  @override
  Future<Either<Failure, void>> paymentWithPaypal(
      BuildContext context, OrderEntity orderEntity) async {
    ConfigModel configModel = GetIt.instance<ConfigModel>();
    orderEntity.orderDate = DateTime.now().toString();

    final result = await PaypalService.paymentWithPaypal(
        context: context, configModel: configModel, orderEntity: orderEntity);
    return result.fold((failure) {
      return left(ServerSideError(failure.errorMessage));
    }, (success) {
      return right(null);
    });
  }
}
