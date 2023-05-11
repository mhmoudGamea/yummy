import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:dartz/dartz.dart';

import '../../features/register/login/data/models/login_model.dart';
import '../error/failure.dart';

class FirestoreServices {
  static final GetIt _getIt = GetIt.I;
  final FirebaseFirestore _store = _getIt.get<FirebaseFirestore>();
  // String coll = 'users';

  Future<Either<Failure, String>> createUser(
      {required String coll, required Map<String, dynamic> values}) async {
    try {
      await _store.collection(coll).doc(values['uid']).set(values);
      return right('User added successfully');
    } catch (error) {
      return left(const FireStoreSideError('Failed to add user'));
    }
  }

  Future<Either<Failure, String>> updateUser(
      {required String coll, required Map<String, dynamic> values}) async {
    try {
      await _store.collection(coll).doc(values['uid']).update(values);
      return right('Success update user information');
    } catch (error) {
      return left(
          const FireStoreSideError('Failed to update user information'));
    }
  }

  Future<Either<Failure, LoginModel>> getUser(
      {required String coll, required String uid}) async {
    try {
      final result = await _store.collection(coll).doc(uid).get();
      if (result.data() == null) {
        return left(const FireStoreSideError('Can\'t find user'));
      }
      return right(LoginModel.fromJson(result.data()!));
    } catch (error) {
      return left(const FireStoreSideError('Failed to get user'));
    }
  }
}
