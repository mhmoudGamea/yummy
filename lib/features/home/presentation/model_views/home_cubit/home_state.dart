part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class UserInfoLoading extends HomeState {}

class UserInfoSuccess extends HomeState {
  final String administrativeArea;
  UserInfoSuccess({required this.administrativeArea});
}

class UserInfoFailure extends HomeState {}
