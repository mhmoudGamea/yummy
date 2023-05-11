import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/utils/firestore_services.dart';
import 'package:yummy/core/utils/helper.dart';
import 'package:yummy/core/widgets/tabs_view.dart';
import 'package:yummy/features/register/login/presentation/login_view.dart';
import 'package:yummy/features/welcome/data/models/location_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repos/location/location_repo.dart';
import '../../views/map_view.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepo _locationRepo;
  LocationCubit(this._locationRepo) : super(LocationInitial());

  final GetIt _get = GetIt.I;

  // LocationModel _locationModel =
  //     LocationModel(latitude: 30.0444, longitude: 31.2357);

  late LocationModel _locationModel;
  LocationModel get getLocationModel {
    return _locationModel;
  }

  Future<void> getCurrentDeviceLocation(BuildContext context) async {
    emit(LocationLoading());

    final response = await _locationRepo.getDeviceLocation();
    response.fold(
      (failure) {
        emit(LocationFailure());
        Helper.showCustomToast(
          context: context,
          bgColor: secondaryColor,
          icon: Icons.cancel_outlined,
          msg: failure.errorMessage,
        );
      },
      (success) {
        _locationModel = success;
        emit(LocationSuccess());
        Helper.showCustomToast(
          context: context,
          bgColor: mintGreen,
          icon: Icons.check_circle_outline_rounded,
          msg: 'Success detect your location.',
        );
        GoRouter.of(context).push(MapView.rn, extra: _locationModel);
      },
    );
  }

  // this function will be called when you change the camera movement of the map
  // so it will give you a realtime updates of your current lat & long
  Future<void> getCameraPosition(CameraPosition cameraPosition) async {
    _locationModel.latitude = cameraPosition.target.latitude;
    _locationModel.longitude = cameraPosition.target.longitude;
    emit(CameraLocationChanged());
  }

  // as the name suggest it 'll be called when the camera movement is idle or stopped
  // so it will give you the lat & long you stop at

  // TODO: _address, _administrativeArea shouldn't have initial value, 'll be modified later
  var _address = 'Egypt Menofia Governorate Shibin el Kom';
  var _administrativeArea = 'Menofia Governorate';

  String get getAddress {
    return _address;
  }

  String get getAdministrativeArea {
    return _administrativeArea;
  }

  Future<void> onCameraIdle() async {
    emit(AddressLocationLoading());
    List<Placemark> placemarks = await placemarkFromCoordinates(
        _locationModel.latitude, _locationModel.longitude);
    _address =
        '${placemarks.first.country}, ${placemarks.first.administrativeArea}, ${placemarks.first.subAdministrativeArea} ${placemarks.first.locality}';
    _administrativeArea = '${placemarks.first.administrativeArea}';
    emit(AddressLocationChanged());
  }

  // store lat & long & address in shared preferences

  Future<void> saveInShared() async {
    SharedPreferences prefs = _get.get<SharedPreferences>();
    prefs.setDouble('latitude', _locationModel.latitude);
    prefs.setDouble('longitude', _locationModel.longitude);
    prefs.setString('address', _address);
    prefs.setString('administrativeArea', _administrativeArea);
  }

  // store user lat & long in firestore but if he didn't logging in then
  // he should log in first to safe his lat & long

  Future<void> confirmLocation(BuildContext context) async {
    // we call saveInShared method to save lat , long and address first
    await saveInShared();

    final user = _get.get<FirebaseAuth>().currentUser;
    FirestoreServices services = _get.get<FirestoreServices>();
    if (user != null) {
      // the user is already authenticated[his uid and number are stored] so we just need to update his lat, long & address
      // in reality the user can't be authenticated and goto update his lat , long
      services.updateUser(coll: 'users', values: {
        'id': user.uid,
        'phoneNumber': user.phoneNumber,
        'latitude': _locationModel.latitude,
        'longitude': _locationModel.longitude,
        'address': _address,
        'administrativeArea': _administrativeArea,
      });
      GoRouter.of(context).push(TabsView.rn);
    } else {
      // the user is not authenticated so we need to log him in then
      // while logging we store his lat, long & address
      _locationModel.address = _address;
      _locationModel.administrativeArea = _administrativeArea;
      GoRouter.of(context).push(LoginView.rn, extra: _locationModel);
    }
  }
}
