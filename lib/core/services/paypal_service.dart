import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:yummy/features/user/payment/data/paypal_model/paypal_payment_model/paypal_payment_model.dart';

import '../../features/user/payment/data/paypal_model/config_model.dart';
import '../../features/user/payment/domain/paypal_entity/order_entity.dart';
import '../error/failure.dart';

class PaypalService {
  static Future<Either<Failure, bool>> paymentWithPaypal({
    required BuildContext context,
    required ConfigModel configModel,
    required OrderEntity orderEntity,
  }) async {
    Completer<Either<Failure, bool>> completer = Completer();
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: configModel.clientId,
          secretKey: configModel.secretKey,
          transactions: [
            PaypalPaymentModel.fromOrderEntity(orderEntity).toJson()
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            return completer.complete(right(true));
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
            return completer.complete(left(ServerSideError(error)));
          },
          onCancel: () {
            log('cancelled:');
            return completer
                .complete(left(ServerSideError('Operation cancelled')));
          },
        ),
      ),
    );
    log('error in payment');
    return completer.future;
  }
}
