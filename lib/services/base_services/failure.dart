import 'dart:async';
import 'dart:io';

import 'package:green_tech_app/services/base_services/exception_model.dart';
import 'package:green_tech_app/services/base_services/service_const.dart';


abstract class Failure {}

class NullFailure implements Failure {
  const NullFailure._();

  factory NullFailure() => instance;
  static const instance = NullFailure._();
}

class ServerFailure implements Failure {
  final String? error;
  ServerFailure({this.error});
  @override
  String toString() {
    return error!;
  }
}

class InputFailure implements Failure {
  final String? errorMessage;
  InputFailure({this.errorMessage});
  @override
  String toString() {
    return errorMessage!;
  }
}

class NotFoundFailure implements Failure {
  final String? errorMessage;
  NotFoundFailure({this.errorMessage});
  @override
  String toString() {
    return errorMessage!;
  }
}

class BadAuthFailure implements Failure {
  final String? errorMessage;
  BadAuthFailure({this.errorMessage});
  @override
  String toString() {
    return errorMessage!;
  }
}

class NetworkFailure implements Failure {
  final String? message;

  NetworkFailure({this.message});
  @override
  String toString() {
    return message!;
  }
}

class TimeoutFailure implements Failure {
  final String? message;

  TimeoutFailure({this.message});
  @override
  String toString() {
    return message!;
  }
}

class UnknownFailure implements Failure {
  final String? message;
  UnknownFailure({this.message});
  @override
  String toString() {
    return message!;
  }
}

Failure convertException(e) {
  if (e is InputException ||
      e is ServerException ||
      e is UnauthorisedException) {
    return e.toFailure();
  } else if (e is NetworkException || e is SocketException) {
    return NetworkFailure(message: networkErrorMessage);
  } else if (e is TimeoutException) {
    return TimeoutFailure(message:timeOutError );
  } else {
    return UnknownFailure(message: unknonError);
  }
}

class ImagePickerFailure implements Failure {
  final String errorMessage;

  ImagePickerFailure(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}

class NoImageFailure implements Failure {
  final String errorMessage;

  NoImageFailure(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}

class ImagePermanentlyDeniedFailure implements Failure {
  final String errorMessage;

  ImagePermanentlyDeniedFailure(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}
