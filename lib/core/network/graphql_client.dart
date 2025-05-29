import 'package:graphql_flutter/graphql_flutter.dart' hide ServerException;
import 'package:spacex/core/constants/api_constant.dart';
import 'package:spacex/core/errors/exceptions.dart';

class GraphQLClientService {
  static GraphQLClient? _client;

  static Future<void> initClient() async {
    await initHiveForFlutter();

    final httpLink = HttpLink(ApiConstant.baseURL);

    _client = GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: httpLink,
    );
  }

  static GraphQLClient getClient() {
    if (_client == null) {
      throw ServerException(message: 'SpaceX GraphQL client not initialized');
    }
    return _client!;
  }
}
