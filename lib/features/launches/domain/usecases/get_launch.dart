import 'package:dartz/dartz.dart';
import 'package:spacex/core/errors/failures.dart';
import 'package:spacex/features/launches/data/repositories/launch_repository.dart';
import 'package:spacex/features/launches/domain/entities/launch_entity.dart';

class GetLaunches {
  final LaunchesRepository repository;

  GetLaunches(this.repository);

  Future<Either<Failure, List<LaunchEntity>>> call() async {
    return await repository.getLaunches();
  }
}
