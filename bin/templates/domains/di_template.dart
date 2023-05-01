import 'dart:io';

import '../../extensions/to_pascal_case.dart';

diTemplate(String moduleName, Directory dir) {
  String template = """
class ExampleDependency {
  ExampleDependency() {
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

  String className = moduleName.toPascalCase();
  String variableName = moduleName.toCamelCase();
  String lowerCaseWithUnderscore = moduleName.toLowerCaseWithUnderscore();
  template = template.replaceAll("Example", className);
  template = template.replaceAll("example", variableName);
  template = template.replaceAll("import_name", lowerCaseWithUnderscore);

  var file = File('${dir.path}/${moduleName}_dependency.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
