import 'dart:developer';

import 'package:ateam_software_test/common/utils/log_utils.dart';
import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  final Function(DioException)? onRequestError;
  //For case response data is too large, dont need to show on log
  final bool Function(Response)? ignoreReponseDataLog;

  LoggerInterceptor({this.onRequestError, this.ignoreReponseDataLog});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    LogUtils.i({
      'from': 'onRequest',
      'Time': DateTime.now().toString(),
      'baseUrl': options.baseUrl,
      'path': options.path,
      'headers': options.headers,
      'method': options.method,
      'requestData': options.data,
      'queryParameters': options.queryParameters,
    });
    log('curl: ${_generateCurlCommand(options)}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LogUtils.i({
      'from': 'onResponse',
      'Time': DateTime.now().toString(),
      'statusCode': response.statusCode,
      'baseUrl': response.requestOptions.baseUrl,
      'path': response.requestOptions.path,
      'method': response.requestOptions.method,
      if (ignoreReponseDataLog == null ||
          ignoreReponseDataLog?.call(response) == false)
        'responseData': response.data,
    });

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    LogUtils.e({
      'from': 'onError',
      'Time': DateTime.now().toString(),
      'baseUrl': error.requestOptions.baseUrl,
      'header': error.requestOptions.headers,
      'path': error.requestOptions.path,
      'type': error.type.toString(),
      'message': error.message,
      'statusCode': error.response?.statusCode,
      'error': error.error.toString(),
      'responseData': error.response?.data,
    }, error);
    onRequestError?.call(error);

    super.onError(error, handler);
  }

  String _generateCurlCommand(RequestOptions options) {
    final buffer = StringBuffer();

    // Add curl command
    buffer.write('curl -X ${options.method.toUpperCase()}');

    // Add URL
    final url = '${options.baseUrl}${options.path}';
    buffer.write(' "$url"');

    // Add headers
    options.headers.forEach((key, value) {
      if (key.toLowerCase() != 'content-length') {
        buffer.write(' \\\n  -H "$key: $value"');
      }
    });

    // Add query parameters
    if (options.queryParameters.isNotEmpty) {
      final queryString = options.queryParameters.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      buffer.write(' \\\n  -G --data-urlencode "$queryString"');
    }

    // Add request body
    if (options.data != null) {
      String dataString;
      if (options.data is String) {
        dataString = options.data as String;
      } else if (options.data is Map || options.data is List) {
        dataString = options.data.toString();
      } else {
        dataString = options.data.toString();
      }

      // Escape quotes and newlines for curl
      dataString = dataString.replaceAll('"', '\\"').replaceAll('\n', '\\n');
      buffer.write(' \\\n  -d "$dataString"');
    }

    return buffer.toString();
  }
}
