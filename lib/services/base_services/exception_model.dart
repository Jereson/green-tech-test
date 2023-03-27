

import 'package:green_tech_app/services/base_services/failure.dart';
import 'package:green_tech_app/services/base_services/service_const.dart';


class ServerException implements Exception {
  final String errorMessage;
  ServerException({this.errorMessage = serverErrorMessage});
  ServerFailure toFailure() => ServerFailure(error: errorMessage);
}

class InputException implements Exception {
  final String? errorMessage;
  InputException({this.errorMessage});
  InputFailure toFailure() => InputFailure(errorMessage: errorMessage);
}

class UnauthorisedException implements Exception {
  final String errorMessage;
  UnauthorisedException({this.errorMessage = ''});
  BadAuthFailure toFailure() => BadAuthFailure(errorMessage: errorMessage);
}

class NetworkException implements Exception {}

class UnknownException implements Exception {}
