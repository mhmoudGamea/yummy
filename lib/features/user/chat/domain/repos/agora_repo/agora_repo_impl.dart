import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/core/constants.dart';
import 'package:yummy/core/error/failure.dart';
import 'package:yummy/core/models/user_model.dart';
import 'package:yummy/core/utils/firestore_services.dart';
import 'package:yummy/features/user/chat/domain/repos/agora_repo/agora_repo.dart';

class AgoraRepoImpl implements AgoraRepo {
  final FirestoreServices _firestoreServices =
      GetIt.instance<FirestoreServices>();
  @override
  Future<Either<Failure, UserModel>> getReceiverData(
      {required String receiverUid}) async {
    try {
      final response = await _firestoreServices.getUser(
          coll: kUsersCollection, uid: receiverUid);

      return right(UserModel.fromJson(response));
    } on FireStoreSideError catch (error) {
      return left(FireStoreSideError(error.errorMessage));
    } catch (error) {
      return left(ServerSideError(error.toString()));
    }
  }
}
