import 'package:dartz/dartz.dart';
import 'package:spacex/core/errors/exceptions.dart';
import 'package:spacex/core/errors/failures.dart';
import 'package:spacex/core/network/network_info.dart';
import 'package:spacex/features/launches/data/datasources/launch_remote_datasource.dart';
import 'package:spacex/features/launches/data/repositories/launch_repository.dart';
import 'package:spacex/features/launches/domain/entities/launch_entity.dart';

class LaunchesRepositoryImpl implements LaunchesRepository {
  final LaunchesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  LaunchesRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<LaunchEntity>>> getLaunches() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteLaunches = await remoteDataSource.getLaunches();
        return Right(remoteLaunches);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }



}