import 'dart:io';

exception(Directory dir) {
  String template = """
class ServerException implements Exception {}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}

""";

  var file = File('${dir.path}/exception.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
