class Config {
  static final Config instance = Config._();

  Config._();

  AppConfig get appConfig => _appConfig;
  late AppConfig _appConfig;

  void setup(Map<String, dynamic> env) {
    _appConfig = AppConfig.from(env);
  }
}

class AppConfig {
  String envName;
  bool developmentMode;
  String appName;
  String baseApiLayer;

  AppConfig(
    this.envName,
    this.developmentMode,
    this.appName,
    this.baseApiLayer,
  );

  AppConfig.from(Map<String, dynamic> env)
    : envName = env[('ENVIRONMENT_NAME')],
      developmentMode = env[('DEVELOPMENT_MODE')] == 'TRUE',
      appName = env[('APP_NAME')],
      baseApiLayer = env[('BASE_API_LAYER')];

  bool get isDevBuild => envName == devEnvName;

  bool get isProdBuild => envName == prodEnvName;

  static const String devEnvName = 'dev';
  static const String prodEnvName = 'production';
}
