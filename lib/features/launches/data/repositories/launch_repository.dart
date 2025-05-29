import 'package:dartz/dartz.dart';
import 'package:spacex/core/errors/failures.dart';
import 'package:spacex/features/launches/domain/entities/launch_entity.dart';

abstract class LaunchesRepository {
  Future<Either<Failure, List<LaunchEntity>>> getLaunches();
}
