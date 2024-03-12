import 'package:beer_hunter/networking/domain_errors.dart';
import 'package:dio/dio.dart';

abstract class ErrorParser {
  Error parseAsError(Object o);
}

class BasicErrorParser implements ErrorParser {
  BasicErrorParser();

  @override
  Error parseAsError(Object o) {
    if (o is DioException) {
      return GenericError(message: o.message);
    }
    return GenericError();
  }
}
