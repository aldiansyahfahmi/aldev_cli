import 'dart:io';

appConstants(Directory dir) {
  String template = """
class AppConstants {
  const AppConstants();

  static App app = const App();
  static CachedKey cachedKey = const CachedKey();
  static AppApi appApi = const AppApi();
  static ErrorKey errorKey = const ErrorKey();
  static ErrorMessage errorMessage = const ErrorMessage();
}

class App {
  const App();

  double get defaultMargin => 16.0;
  String get androidAppId => '';
  String get iosAppId => '';
}

class CachedKey {
  const CachedKey();

  String get tokenKey => 'tokenKey';
  String get roleKey => 'roleKey';
}

class AppApi {
  const AppApi();
  String get baseUrlDevelopment => 'http://';
  String get baseUrlProduction => 'https://';

  String get login => 'login';
}

class ErrorKey {
  const ErrorKey();

  String get message => "message";
}

class ErrorMessage {
  const ErrorMessage();

  String get failedGetToken => 'failed get token';
  String get failedGetRole => 'failed get role';
}

""";

  var file = File('${dir.path}/app_constants.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
