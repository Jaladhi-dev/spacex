class ServerException implements Exception {
  final String message;
  final int? code;

  ServerException({required this.message, this.code});
}

class NetworkException implements Exception {
  final String message;

  NetworkException({required this.message});
}

class CacheException implements Exception {
  final String message;

  CacheException({required this.message});
}