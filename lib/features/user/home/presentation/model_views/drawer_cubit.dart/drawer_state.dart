abstract class DrawerState {}

class DrawerInitial extends DrawerState {}

class UserDataLoading extends DrawerState {}

class UserDataSuccess extends DrawerState {}

class UserDataFailure extends DrawerState {
  final String error;

  UserDataFailure(this.error);
}
