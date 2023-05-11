import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../data/user_info_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, UserInfoModel>> getUserInformation();
}
