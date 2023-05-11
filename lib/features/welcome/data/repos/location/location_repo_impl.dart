import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../core/error/failure.dart';
import '../../models/location_model.dart';
import 'location_repo.dart';

class LocationRepoImpl implements LocationRepo {
  Future<Either<String, bool>> checkUserPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      final userPermission = await Geolocator.requestPermission();
      if (userPermission == LocationPermission.denied) {
        return left('Location permissions are denied');
      } else if (userPermission == LocationPermission.deniedForever) {
        return left(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      return right(true);
    } else {
      return right(true);
    }
  }

  @override
  Future<Either<Failure, LocationModel>> getDeviceLocation() async {
    try {
      final response = await checkUserPermissions();
      dynamic permission;
      response.fold((String value) {
        permission = value;
      }, (bool value) {
        permission = value;
      });
      if (permission != true) {
        return left(LocationSideError.fromDeviceLocation(permission!));
      } else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        LocationModel locationModel = LocationModel(
            latitude: position.latitude, longitude: position.longitude);
        return right(locationModel);
      }
    } on TimeoutException catch (error) {
      return left(LocationSideError.fromDeviceLocation(error.message!));
    } on LocationServiceDisabledException {
      return left(const LocationSideError(
          'The location services of the device are disabled.'));
    } catch (error) {
      return left(const LocationSideError('Unable to detect your location.'));
    }
  }
}
