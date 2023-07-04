part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class PickProfileImage extends ProfileState {}

class UploadProfileImageLoading extends ProfileState {}

class UploadProfileImageSuccess extends ProfileState {}

class UploadProfileImageFailure extends ProfileState {}

class GetUserInfoLoading extends ProfileState {}

class GetUserInfoSuccess extends ProfileState {}

class GetUserInfoFailure extends ProfileState {}
