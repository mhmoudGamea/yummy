import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/core/constants.dart';

import 'package:yummy/core/error/failure.dart';

import 'profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  static final _store = GetIt.instance<FirebaseFirestore>();
  static final _uid = GetIt.instance.get<FirebaseAuth>().currentUser!.uid;
  final _collectionRef = _store
      .collection(kUsersCollection)
      .doc(_uid)
      .collection(kOrdersCollection);
  @override
  Future<Either<Failure, int>> getOrdersNumber() async {
    try {
      final result = await _collectionRef.get();
      return right(result.docs.length);
    } catch (error) {
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, double>> getUserSpending() async {
    try {
      final result = await _collectionRef.get();
      double total = 0.0;
      for (var doc in result.docs) {
        total += doc.data()['totalPrice'];
      }
      return right(total);
    } catch (error) {
      return left(ServerSideError(error.toString()));
    }
  }
}
