part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

// number of orderss
class NumberOfOrdersLoading extends ProfileState {}

class NumberOfOrdersSuccess extends ProfileState {}

class NumberOfOrdersFailure extends ProfileState {}

// user spending
class UserSpendingLoading extends ProfileState {}

class UserSpendingSuccess extends ProfileState {}

class UserSpendingFailure extends ProfileState {}

// pick profile image from picker
class SuccessfulPickingProfileImage extends ProfileState {}

class ErrorPickingProfileImage extends ProfileState {}

// upload profile image to storage
class UploadProfileImageLoading extends ProfileState {}

class UploadProfileImageSuccess extends ProfileState {}

class UploadProfileImageFailure extends ProfileState {}

// save profile image in store
class SaveProfileImageLoading extends ProfileState {}

class SaveProfileImageSuccess extends ProfileState {}

class SaveProfileImageFailure extends ProfileState {}

// get user info
class GetUserInfoLoading extends ProfileState {}

class GetUserInfoSuccess extends ProfileState {}

class GetUserInfoFailure extends ProfileState {}

// 3 states for confirm editing user information
class ConfirmEditingLoading extends ProfileState {}

class ConfirmEditingSuccess extends ProfileState {}

class ConfirmEditingFailure extends ProfileState {}
