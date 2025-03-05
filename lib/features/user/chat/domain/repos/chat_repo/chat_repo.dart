import 'package:dartz/dartz.dart';
import 'package:yummy/core/models/user_model.dart';

import '../../../../../../core/error/failure.dart';

abstract class ChatRepo {
  Future<Either<Failure, List<UserModel>>> getContacts();
  Future<Either<Failure, void>> sendMessage({
    required String message,
    required String receiverUid,
  });
}
