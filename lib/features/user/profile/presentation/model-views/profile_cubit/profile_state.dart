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

// 3 states for confirm editing user information
class ConfirmEditingLoading extends ProfileState {}

class ConfirmEditingWithImageSuccess extends ProfileState {}

class ConfirmEditingWithoutImageSuccess extends ProfileState {}

class ConfirmEditingFailure extends ProfileState {}
