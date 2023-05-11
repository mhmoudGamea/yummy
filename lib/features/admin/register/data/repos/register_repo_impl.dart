import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/firestore_services.dart';
import '../models/login_model.dart';
import './register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final FirebaseAuth _auth = GetIt.I.get<FirebaseAuth>();
  final FirestoreServices _services = GetIt.I.get<FirestoreServices>();
  @override
  Future<Either<Failure, String>> registerUserWithEmailPass(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      final cradentials = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // save admin info in firestore
      LoginModel model = LoginModel(
          userName: userName,
          email: email,
          password: password,
          uid: cradentials.user!.uid);
      await _services.createUser(coll: 'admins', values: model.toJson());

      return right('Successfully registration.');
    } on FirebaseAuthException catch (error) {
      return left(FirebaseSideError.fromSignin(error.code));
    }
  }
}
