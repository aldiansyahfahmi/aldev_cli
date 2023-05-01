import 'dart:io';

import '../../extensions/to_pascal_case.dart';

diTemplate(String moduleName, Directory dir) {
  String className = moduleName.toPascalCase();
  String template = """
class ${className}Dependency {
  ${className}Dependency() {
    _registerDataSources();
    _registerMapper();
    _registerRepository();
    _registerUseCases();
  }

  void _registerDataSources() {

  }

  void _registerMapper() {

  }

  void _registerRepository() {

  }

  void _registerUseCases() {

  }
}
""";

  var file = File('${dir.path}/${moduleName}_dependency.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
