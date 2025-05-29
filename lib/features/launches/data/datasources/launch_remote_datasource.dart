import 'package:graphql_flutter/graphql_flutter.dart' hide ServerException;
import 'package:spacex/core/errors/exceptions.dart';
import 'package:spacex/features/launches/data/models/launch_model.dart';
import 'package:spacex/graphql/queries/queries.dart';

abstract class LaunchesRemoteDataSource {
  Future<List<LaunchModel>> getLaunches();
}

class LaunchRemoteDataSourceImpl implements LaunchesRemoteDataSource {
  final GraphQLClient client;

  LaunchRemoteDataSourceImpl(this.client);

  @override
  Future<List<LaunchModel>> getLaunches() async {
    try {
      final result = await client.query(QueryOptions(document: gql(SpaceXQueries.launches)));

      if (result.hasException) {
        throw ServerException(message: result.exception.toString());
      }

      final data = result.data?['launches'] as List<dynamic>;
      return data.map((json) => LaunchModel.fromJson(json)).toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
