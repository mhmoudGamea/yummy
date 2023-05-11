import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, String>> loginUserWithEmailPass(
      {required String email, required String password});
}
