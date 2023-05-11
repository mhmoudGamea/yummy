import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';

abstract class RegisterRepo {
  Future<Either<Failure, String>> registerUserWithEmailPass(
      {required String userName,
      required String email,
      required String password});
}
