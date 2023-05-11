import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../models/location_model.dart';

abstract class LocationRepo {
  Future<Either<Failure, LocationModel>> getDeviceLocation();
}
