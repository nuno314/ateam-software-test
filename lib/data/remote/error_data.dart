part of 'app_api_service.dart';

enum ErrorType {
  noInternet,
  httpException,
  timeout,

  /// occurred when refresh token with invalid token or user not found `or`
  /// status code is 401
  unauthorized,
  unknown,
  grapQLUnknown,
  grapQLInvalidToken,
  serverUnExpected,
}

class ErrorData {
  ErrorType? type;
  String? message;
  int? statusCode;

  ErrorData({this.type, this.statusCode, this.message});

  ErrorData.fromDio(DioException error) {
    type = ErrorType.unknown;
    message = error.message;

    switch (error.type) {
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
        type = ErrorType.timeout;
        break;
      case DioExceptionType.badResponse:
      case DioExceptionType.badCertificate:
        statusCode = error.response?.statusCode;
        final errorCode = error.response?.data is Map<dynamic, dynamic>
            ? error.response?.data['code']?.toString()
            : null;
        if (errorCode == 'invalidToken' ||
            errorCode == 'userNotFound' ||
            statusCode == 401) {
          type = ErrorType.unauthorized;
          if (error.response?.data is Map<dynamic, dynamic>) {
            message = getErrorMessage(error.response?.data);
          }
        } else {
          type = ErrorType.httpException;
          if (error.response?.data is Map<dynamic, dynamic>) {
            message = getErrorMessage(error.response?.data);
          }
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
      case DioExceptionType.connectionError:
        if (error.message?.contains('Unexpected character') ?? false) {
          type = ErrorType.serverUnExpected;
        } else {
          type = ErrorType.noInternet;
        }
        break;
    }
  }

  String getErrorMessage(Map<String, dynamic> dataRes) {
    LogUtils.e('getErrorMessage $dataRes');
    try {
      if (dataRes.containsKey('message') && dataRes['message'] != null) {
        return dataRes['message'].toString();
      }
      if (dataRes.containsKey('error') && dataRes['error'] != null) {
        return dataRes['error'].toString();
      }
      if (dataRes.containsKey('failedMessage') && dataRes['failedMessage'] != null) {
        return dataRes['failedMessage'].toString();
      }
    } catch (e) {
      /* ignore */
    }
    return dataRes.toString();
  }
}
