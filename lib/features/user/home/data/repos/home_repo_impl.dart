import 'package:get_it/get_it.dart';
import 'package:dartz/dartz.dart';
import 'package:yummy/core/services/user_service.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/models/user_model.dart';
import './home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final UserService _userService = GetIt.instance.get<UserService>();

  @override
  Future<Either<Failure, UserModel>> getUserInformation() async {
    try {
      final userDate = await _userService.getUserProfileData();
      if (userDate.isEmpty) {
        return left(
          const FireStoreSideError(
              'Sorry we can\'t find your data, please try to login again.'),
        );
      } else {
        return right(UserModel.fromJson(userDate));
      }
    } catch (error) {
      return left(
        FireStoreSideError(error.toString()),
      );
    }
  }
}
