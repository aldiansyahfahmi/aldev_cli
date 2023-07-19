import 'dart:io';

injection(Directory dir) {
  String template = """
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class Injections {
    Future<void> initialize() async {
  }
}

""";

  var file = File('${dir.path}/injections.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
