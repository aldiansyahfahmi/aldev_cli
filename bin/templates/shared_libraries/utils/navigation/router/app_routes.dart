import 'dart:io';

appRoutes(Directory dir) {
  String template = """
class AppRoutes {
  static const String home = '/home';
  static const String example = '/example';
}

""";

  var file = File('${dir.path}/app_routes.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
