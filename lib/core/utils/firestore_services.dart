import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:dartz/dartz.dart';
import '../../features/admin/register/data/models/login_model.dart';
import '../error/failure.dart';

class FirestoreServices {
  static final GetIt _getIt = GetIt.I;
  final FirebaseFirestore _store = _getIt.get<FirebaseFirestore>();
  final FirebaseAuth _auth = _getIt.get<FirebaseAuth>();
  final FirebaseStorage _storage = _getIt.get<FirebaseStorage>();
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

  // store image in firebase storage
  Future<Either<Failure, String>> storeInFirebaseStorage(
      {required String folder, required File imageFilePath}) async {
    String imageName =
        '$folder/${_auth.currentUser!.uid}/${DateTime.now().microsecondsSinceEpoch}';
    final storageRef = _storage.ref(imageName);
    String? downloadedUrl;
    try {
      await storageRef.putFile(imageFilePath);
      downloadedUrl = await storageRef.getDownloadURL();
      return right(downloadedUrl);
    } catch (error) {
      return left(StorageSideError.fromStore('Can\'t save this image.'));
    }
  }

  Future<Either<Failure, String>> storeInFirebaseStore(
      {required String coll, required Map<String, dynamic> map}) async {
    try {
      await _store.collection(coll).doc(map['id']).set(map);
      return right('Success to add');
    } catch (error) {
      return left(FirebaseSideError('Failed to add'));
    }
  }

  Future<String> deleteFromFirebaseStore(
      {required String coll, required String id}) async {
    try {
      await _store.collection(coll).doc(id).delete();
      return 'Deleted successfully';
    } catch (error) {
      return 'Failed to delete';
    }
  }
}
