import 'dart:io';

appSetup(Directory dir) {
  String template = """
import '../constants/app_constants.dart';

enum Flavor {
  dev,
  prod,
}

class Config {
  static Config? _instance;

  Config._internal() {
    _instance = this;
  }

  factory Config() => _instance ?? Config._internal();

  static Flavor? appFlavor;

  static bool get isDebug {
    if (appFlavor == Flavor.dev) {
      return true;
    } else {
      return false;
    }
  }

  static String get baseUrl {
    if (appFlavor == Flavor.prod) {
      return AppConstants.appApi.baseUrlProduction;
    } else {
      return AppConstants.appApi.baseUrlDevelopment;
    }
  }
}

""";

  var file = File('${dir.path}/app_setup.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
