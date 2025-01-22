import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/models/user_model.dart';
import './home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final FirebaseAuth _auth = GetIt.I.get<FirebaseAuth>();
  final FirebaseFirestore _store = GetIt.I.get<FirebaseFirestore>();

  @override
  Future<Either<Failure, UserModel>> getUserInformation() async {
    try {
      final userDate =
          await _store.collection('users').doc(_auth.currentUser!.uid).get();
      if (userDate.data() == null) {
        return left(
          const FireStoreSideError(
              'Sorry we can\'t find your data, please try to login again.'),
        );
      } else {
        return right(UserModel.fromJson(userDate.data()!));
      }
    } catch (error) {
      return left(
        FireStoreSideError(error.toString()),
      );
    }
  }
}
