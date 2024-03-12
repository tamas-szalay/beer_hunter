abstract class Error implements Exception {}

class GenericError implements Error {
  final String? message;

  GenericError({this.message});
}