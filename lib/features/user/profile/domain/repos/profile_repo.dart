import 'package:dartz/dartz.dart';
import 'package:yummy/core/error/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, int>> getOrdersNumber();
  Future<Either<Failure, double>> getUserSpending();
}
