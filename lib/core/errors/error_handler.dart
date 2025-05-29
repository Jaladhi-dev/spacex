import 'package:graphql_flutter/graphql_flutter.dart' hide ServerException, NetworkException;
import 'exceptions.dart';
import 'failures.dart';

class ErrorHandler {
  static Failure handleError(dynamic error) {
    if (error is ServerException) {
      return ServerFailure(message: error.message);
    } else if (error is NetworkException) {
      return NetworkFailure(message: error.message);
    } else if (error is CacheException) {
      return CacheFailure(message: error.message);
    } else if (error is GraphQLError) {
      return ServerFailure(message: error.message);
    } else {
      return ServerFailure(message: 'Unexpected error occurred');
    }
  }
}