import 'package:dartz/dartz.dart';
import 'package:yummy/core/error/failure.dart';

import '../models/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<SearchModel>>> searchFood(String value);
}
