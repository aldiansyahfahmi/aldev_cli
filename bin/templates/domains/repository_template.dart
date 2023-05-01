import 'dart:io';

import '../../extensions/to_pascal_case.dart';

repositoryTemplate(String moduleName, Directory dir) {
  String template = """
abstract class ExampleRepository {
  const ExampleRepository();

}
""";

  String className = moduleName.toPascalCase();
  String variableName = moduleName.toCamelCase();
  String lowerCaseWithUnderscore = moduleName.toLowerCaseWithUnderscore();
  template = template.replaceAll("Example", className);
  template = template.replaceAll("example", variableName);
  template = template.replaceAll("import_name", lowerCaseWithUnderscore);

  var file = File('${dir.path}/${moduleName}_repository.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
