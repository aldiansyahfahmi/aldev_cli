import 'dart:io';

import '../../extensions/to_pascal_case.dart';

mapperTemplate(String moduleName, Directory dir) {
  String template = """
class ExampleMapper {

}
""";

  String className = moduleName.toPascalCase();
  String variableName = moduleName.toCamelCase();
  String lowerCaseWithUnderscore = moduleName.toLowerCaseWithUnderscore();
  template = template.replaceAll("Example", className);
  template = template.replaceAll("example", variableName);
  template = template.replaceAll("import_name", lowerCaseWithUnderscore);

  var file = File('${dir.path}/${moduleName}_mapper.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
