import 'dart:async';

import 'package:ateam_software_test/data/local/local_key.dart';
import 'package:ateam_software_test/di/di.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class LocalDataManager {
  final SharedPreferences _sharedPreferences = injector.get();

  Future<bool> setAppLaunched() {
    return _sharedPreferences.setBool(LocalDataKey.launchedApp, true);
  }

  bool getAppLaunched() {
    return _sharedPreferences.getBool(LocalDataKey.launchedApp) ?? false;
  }
}
