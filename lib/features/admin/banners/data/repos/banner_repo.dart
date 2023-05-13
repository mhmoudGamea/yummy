import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yummy/core/error/failure.dart';

abstract class BannerRepo {
  Future<Either<Failure, String>> uploadImage(
      {required String folder, required File imageFilePath});
  Future<String> storeBanner(
      {required String coll, required Map<String, dynamic> map});
}
