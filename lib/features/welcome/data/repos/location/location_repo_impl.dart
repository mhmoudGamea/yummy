import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:yummy/core/services/location_service.dart';

import '../../../../../core/error/failure.dart';
import '../../models/location_model.dart';
import 'location_repo.dart';

class LocationRepoImpl implements LocationRepo {
  // only will return error if user deny location permission or location model
  @override
  Future<Either<Failure, LocationModel>> getDeviceLocation() async {
    try {
      final response = await LocationService.getDeviceLatLong();
      return right(response);
    } on LocationSideError catch (error) {
      return left(LocationSideError(error.errorMessage));
    }
  }
}
