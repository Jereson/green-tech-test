import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/services/base_services/api_responss.dart';
import 'package:green_tech_app/services/base_services/failure.dart';
import 'package:green_tech_app/services/base_services/service_const.dart';
import 'package:green_tech_app/utils/local_storage.dart';
import 'package:http/http.dart' as http;

class BaseDatasource {
  Uri _url(String endpoint) => Uri.parse('$baseUrl/$endpoint');

  Uri _urlWithQueryParams(String endpoint, Map<String, dynamic> queryParams) =>
      Uri.parse('$baseUrl/$endpoint');

  Map<String, String> get jsonHeadersWithoutToken => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

  Map<String, String> get jsonHeaders => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${getIt.get<LocalStorage>().getUserToken()}',
      };

  Future<ApiResponse<Map<String, dynamic>>> _processRequest(
    Future<http.Response> request,
  ) async {
    try {
      final response = await request.timeout(dbTimeOut,
          onTimeout: () => throw TimeoutException(serverErrorMessage));
      debugPrint('RESPONSE STATUS ---- ${response.statusCode}');
      debugPrint('RESPONSE BODY ---- ${response.body}');
      final data = jsonDecode(response.body);

      final error = _checkForError(response.statusCode, data);
      return ApiResponse(
        data: data,
        error: error,
      );
    } on FormatException {
      return ApiResponse(error: ServerFailure(error: serverErrorMessage));
    } catch (e) {
      return ApiResponse(error: convertException(e));
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> sendGet(
      {String? endpoint,
      bool useToken = true,
      Map<String, dynamic>? queryParams}) {
    final url = queryParams != null
        ? _urlWithQueryParams(endpoint!, queryParams)
        : _url(endpoint!);

    final request = http.get(
      url,
      headers: useToken ? jsonHeaders : jsonHeadersWithoutToken,
    );
    debugPrint('REQUEST -- $url');
    return _processRequest(request);
  }

  Future<ApiResponse<Map<String, dynamic>>> sendPost(
      {String? endpoint,
      Map<String, dynamic>? payload,
      bool useToken = true}) async {
    final url = _url(endpoint!);
    final body = jsonEncode(payload);
    final request = http.post(
      url,
      body: body,
      headers: useToken ? jsonHeaders : jsonHeadersWithoutToken,
    );
    debugPrint('REQUEST -- $url -- $payload');
    return _processRequest(request);
  }

   Future<ApiResponse<Map<String, dynamic>>> sendDelete(
      {String? endpoint,
      Map<String, dynamic>? payload,
      bool useToken = true}) async {
    final url = _url(endpoint!);
    final body = jsonEncode(payload);
    final request = http.delete(
      url,
      body: body,
      headers: useToken ? jsonHeaders : jsonHeadersWithoutToken,
    );
    debugPrint('REQUEST -- $url -- $payload');
    return _processRequest(request);
  }

  Failure _checkForError(int statusCode, data) {
    String? returnedMessage;
    // returnedMessage = '';
    // if (statusCode - 200 <= 99) return NullFailure();
    if (data != null) {
      //Check if request was successful
      bool success = data['success'] ?? data['status'];
      //If successful, return no failure
      // Null failure should be returned if success
      if (success) return NullFailure();
      final errors = data['message'] ?? data['msg']?? data['error'] ?? data['errors'];
      //Check list of errors
      if (errors is String) {
        returnedMessage = errors;
      } else if (errors is Map) {
        //If no error field - use messsage for failure
        if (errors.isEmpty) {
          returnedMessage = data['message'];
        }
        //If there are error fields - use errors for failure
        else {
          // returnedMessage = errors;
          errors.forEach((key, value) {
            if (value is List) {
              returnedMessage = value.first;
            } else {
              returnedMessage = '$returnedMessage\n$value';
            }
          });
        }
      } else if (errors is List) {
        if (errors.isEmpty) {
          returnedMessage = null;
        } else {
          for (var value in errors) {
            if (value is String) {
              returnedMessage = value.toString();
            }
          }
        }
      }
    }

    returnedMessage ??= serverErrorMessage;
    logger.d('-----$returnedMessage-----');

    if (statusCode == 401) {
     
      return BadAuthFailure(errorMessage: returnedMessage);
    } else if (statusCode == 422) {
      return BadAuthFailure(errorMessage: returnedMessage);
    } else if (statusCode == 403) {
      return BadAuthFailure(errorMessage: returnedMessage);
    } else if (statusCode == 404) {
      return NotFoundFailure(errorMessage: returnedMessage);
    } else if (statusCode == 500) {
      return ServerFailure(error: returnedMessage);
    } else if (statusCode == 502) {
      return ServerFailure(error: returnedMessage);
    } else if (statusCode == 503) {
      return ServerFailure(error: returnedMessage);
    } else if (statusCode == 504) {
      return ServerFailure(error: returnedMessage);
    } else {
      return UnknownFailure(message: returnedMessage);
    }
  }
}
