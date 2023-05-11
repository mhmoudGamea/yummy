part of 'location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {}

class LocationFailure extends LocationState {}

// get lat & lang states
class CameraLocationChanged extends LocationState {}

// get address states
class AddressLocationLoading extends LocationState {}

class AddressLocationChanged extends LocationState {}
