part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class UserInfoLoading extends HomeState {}

class UserInfoSuccess extends HomeState {
  UserInfoSuccess();
}

class UserInfoFailure extends HomeState {}

// states of user food
class UserFoodLoading extends HomeState {}

class UserFoodSuccess extends HomeState {
  final List<UserFoodModel> foods;
  UserFoodSuccess({required this.foods});
}

class UserFoodFailure extends HomeState {}
