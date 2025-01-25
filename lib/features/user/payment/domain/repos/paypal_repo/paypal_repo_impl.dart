import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/services/location_service.dart';
import 'package:yummy/core/utils/cache_helper.dart';
import 'package:yummy/features/user/payment/data/paypal_model/config_model.dart';
import 'package:yummy/features/user/payment/data/paypal_model/order_model.dart';
import 'package:yummy/features/user/payment/domain/paypal_entity/address_entity.dart';
import 'package:yummy/features/welcome/data/models/location_model.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/services/paypal_service.dart';
import '../../paypal_entity/order_entity.dart';
import 'paypal_repo.dart';

class PaypalRepoImpl implements PaypalRepo {
  final FirebaseFirestore _store = GetIt.instance<FirebaseFirestore>();
  final FirebaseAuth _auth = GetIt.instance<FirebaseAuth>();

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

  @override
  Future<Either<Failure, AddressEntity>> getUserAddress() async {
    // 1- check user lat long in shared pref
    // 2- if in shared pref get user address from lat and long
    // 3- if not in shared pref get lat and long from device
    // 4- get user address from lat and long
    double? latitude = CacheHelper.getData(kLatitude);
    double? longitude = CacheHelper.getData(kLongitude);
    try {
      if (latitude != null && longitude != null) {
        AddressEntity addressEntity =
            await LocationService.getUserAddress(latitude, longitude);
        return right(addressEntity);
      } else {
        final LocationModel locationModel =
            await LocationService.getDeviceLatLong();
        AddressEntity addressEntity = await LocationService.getUserAddress(
            locationModel.latitude, locationModel.longitude);
        return right(addressEntity);
      }
    } on ServerSideError catch (error) {
      return left(ServerSideError(error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> saveUserOrder(OrderEntity orderEntity) async {
    try {
      await _store
          .collection(kUsersCollection)
          .doc(_auth.currentUser!.uid)
          .collection(kOrdersCollection)
          .doc(orderEntity.orderId)
          .set(
            OrderModel.fromOrderEntity(orderEntity).toJson(),
          );
      return right(null);
    } catch (error) {
      if (error is FirebaseException) {
        return left(FireStoreSideError.fromCredential(error.code));
      }
      log('error here: $error');
      return left(ServerSideError(error.toString()));
    }
  }
}
