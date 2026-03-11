import 'dart:io';

import 'package:ateam_software_test/common/client_info.dart';
import 'package:ateam_software_test/common/config.dart';
import 'package:ateam_software_test/data/remote/https_constants.dart';
import 'package:ateam_software_test/data/remote/interceptor/header_interceptor.dart';
import 'package:ateam_software_test/data/remote/interceptor/logger_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

import 'package:injectable/injectable.dart';

import '../../common/utils/log_utils.dart';

part 'error_data.dart';

@Injectable()
class AppApiService {
  late Dio dio;
  final String baseUrl = Config.instance.appConfig.baseApiLayer;
  ApiServiceDelegate? apiServiceDelegate;


  AppApiService() {
    _config();
  }

  void _config() {
    _setupDioClient();
  }

  Map<String, String> _getDefaultHeader() {
    final defaultHeader = <String, String>{
      HttpConstants.contentType: 'application/json',
      HttpConstants.device: 'mobile',
      HttpConstants.model: ClientInfo.model,
      HttpConstants.osversion: ClientInfo.osversion,
      HttpConstants.appVersion: ClientInfo.appVersionName,
      HttpConstants.appVersionFull: ClientInfo.appVersion,
    };

    if (!kIsWeb) {
      defaultHeader[HttpConstants.osplatform] = Platform.operatingSystem;
    }
    return defaultHeader;
  }

  void _setupDioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        followRedirects: false,
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );

    dio.options.headers.clear();
    dio.options.headers = _getDefaultHeader();

    final clientAdapter = dio.httpClientAdapter;
    if (clientAdapter is IOHttpClientAdapter) {
      clientAdapter.onHttpClientCreate = (client) {
        client.badCertificateCallback = (cert, host, port) {
          LogUtils.d({
            'From': 'AppApiService -> badCertificateCallback',
            'Time': DateTime.now().toString(),
            'host': host,
            'port': port,
            'cert': cert,
          });
          return true;
        };
        return client;
      };
    }

    dio.interceptors.add(HeaderInterceptor(
      getHeader: _getDefaultHeader,
    ));
 
    dio.interceptors.add(
      LoggerInterceptor(
        ignoreReponseDataLog: (response) {
          return false;
        },
      ),
    );

  }

  Future<String?> refreshToken(String token, {bool saveToken = true}) async {
    return null;
  }
}

mixin ApiServiceDelegate {
  void onError(ErrorData onError);
}
