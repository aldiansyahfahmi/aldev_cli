import 'dart:io';

injection(Directory dir) {
  String template = """
class DependencyInjections {
    Future<void> initialize() async {
  }
}

""";

  var file = File('${dir.path}/dependency_injections.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
