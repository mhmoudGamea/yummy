import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/user_model.dart';

abstract class AgoraRepo {
  Future<Either<Failure, UserModel>> getReceiverData({
    required String receiverUid,
  });
}
