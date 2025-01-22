import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../features/welcome/data/models/location_model.dart';
import '../error/failure.dart';

class LocationService {
  static Future<String?> checkUserPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      final userPermission = await Geolocator.requestPermission();
      if (userPermission == LocationPermission.denied) {
        return 'Location permissions are denied';
      } else if (userPermission == LocationPermission.deniedForever) {
        return 'Location permissions are permanently denied, we cannot request permissions.';
      }
    }
    return null;
  }

  static Future<LocationModel> getDeviceLatLong() async {
    try {
      final response = await checkUserPermissions();
      if (response != null) {
        throw left(LocationSideError.fromDeviceLocation(response));
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      log(position.toString());
      LocationModel locationModel = LocationModel(
          latitude: position.latitude, longitude: position.longitude);
      return locationModel;
    } on TimeoutException catch (error) {
      throw left(LocationSideError.fromDeviceLocation(error.message!));
    } on LocationServiceDisabledException {
      throw left(const LocationSideError(
          'The location services of the device are disabled.'));
    } catch (error) {
      throw left(const LocationSideError('Unable to detect your location.'));
    }
  }
}
