import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex/features/launches/data/datasources/launch_remote_datasource.dart';
import 'package:spacex/features/launches/data/repositories/launch_repository.dart';
import 'package:spacex/features/launches/domain/repositiories/launch_repository_impl.dart';
import 'package:spacex/features/launches/domain/usecases/get_launch.dart';
import 'package:spacex/features/launches/presentation/bloc/launch_bloc.dart';
import '../network/network_info.dart';
import '../network/graphql_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(() => LaunchesBloc(getLaunches: sl()));

  // UseCases
  sl.registerLazySingleton(() => GetLaunches(sl()));

  // Repository
  sl.registerLazySingleton<LaunchesRepository>(() => LaunchesRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // Data sources
  sl.registerLazySingleton<LaunchesRemoteDataSource>(() => LaunchRemoteDataSourceImpl(GraphQLClientService.getClient()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(Connectivity()));

  // Initialize GraphQL clients
  await GraphQLClientService.initClient();
}
