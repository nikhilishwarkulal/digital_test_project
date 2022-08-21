///[ServerException] is an user defined type of exception
///Add more exception to list if needed.
class ServerException implements Exception {
  ServerExceptionType exceptionType;
  ServerException._internal({this.exceptionType = ServerExceptionType.unknown});
  factory ServerException.failure() {
    return ServerException._internal(
        exceptionType: ServerExceptionType.failure);
  }
  factory ServerException() {
    return ServerException._internal(
        exceptionType: ServerExceptionType.unknown);
  }
}

enum ServerExceptionType {
  failure,
  unknown,
}
