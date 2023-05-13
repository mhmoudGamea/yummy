import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy/core/error/failure.dart';
import 'package:yummy/core/utils/firestore_services.dart';
import 'package:yummy/features/admin/banners/data/repos/banner_repo.dart';

class BannerRepoImpl implements BannerRepo {
  final FirestoreServices _services = GetIt.I.get<FirestoreServices>();

  @override
  Future<Either<Failure, String>> uploadImage(
      {required String folder, required File imageFilePath}) async {
    late String response;
    try {
      response = await _services.storeInFirebaseStorage(
          folder: folder, imageFilePath: imageFilePath);
      return right(response);
    } catch (error) {
      return left(StorageSideError.fromStore(response));
    }
  }

  @override
  Future<String> storeBanner(
      {required String coll, required Map<String, dynamic> map}) async {
    return await _services.storeInFirebaseStore(coll: coll, map: map);
  }
}
