import 'dart:io';

injection(Directory dir) {
  String template = """
class Injections {
    Future<void> initialize() async {
  }
}

""";

  var file = File('${dir.path}/injections.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
