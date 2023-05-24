import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/core/error/failure.dart';

import './login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final FirebaseAuth _auth = GetIt.I.get<FirebaseAuth>();
  @override
  Future<Either<Failure, String>> loginUserWithEmailPass(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return right('Successfully Logining.');
    } on FirebaseAuthException catch (error) {
      return left(FirebaseSideError.fromLogin(error.code));
    }
  }
}
