import 'dart:convert';

import 'package:logger/logger.dart';

import '../errors/failures.dart';

abstract class HttpInterceptor {
  Future<Map<String, String>> onRequest(Map<String, String> headers);
  Future<void> onResponse(dynamic data, int statusCode);
  Future<void> onError(
    Failure error, {
    String? url,
    String? method,
    Map<String, String>? headers,
    dynamic requestBody,
    dynamic responseBody,
  });
}

class DefaultInterceptor implements HttpInterceptor {
  final _logger = Logger();

  @override
  Future<Map<String, String>> onRequest(Map<String, String> headers) async {
    _logRequest(headers);
    return headers;
  }

  @override
  Future<void> onResponse(dynamic data, int statusCode) async {
    _logResponse(statusCode, data);

    switch (statusCode) {
      case 400:
        await onError(
          BadRequestFailure(data['message']),
          responseBody: data,
        );
        break;
      case 401:
        await onError(
          UnauthorizedFailure(data['message']),
          responseBody: data,
        );
        break;
      case 404:
        await onError(
          NotFoundFailure(data['message']),
          responseBody: data,
        );
        break;
      case 408:
        await onError(
          TimeoutFailure(data['message']),
          responseBody: data,
        );
        break;
      case 500:
      case 502:
      case 503:
        await onError(
          ServerFailure(data['message']),
          responseBody: data,
        );
        break;
    }
  }

  @override
  Future<void> onError(
    Failure error, {
    String? url,
    String? method,
    Map<String, String>? headers,
    dynamic requestBody,
    dynamic responseBody,
  }) async {
    _logger.d('''
      ERROR: ${error.toString()}
      URL: $url
      Method: $method
      Headers: ${_formatJson(headers)}
      Request Body: ${_formatJson(requestBody)}
      Response Body: ${_formatJson(responseBody)}
    ''');
  }

  void _logRequest(Map<String, String> headers) {
    _logger.d('''
      REQUEST
      Headers: ${_formatJson(headers)}
    ''');
  }

  void _logResponse(int statusCode, dynamic data) {
    _logger.d('''
      RESPONSE
      Status Code: $statusCode
      Body: ${_formatJson(data)}
    ''');
  }

  String _formatJson(dynamic data) {
    if (data == null) return 'null';
    try {
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(data);
    } catch (e) {
      return data.toString();
    }
  }
}
