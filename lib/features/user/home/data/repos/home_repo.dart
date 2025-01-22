import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/models/user_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, UserModel>> getUserInformation();
}
