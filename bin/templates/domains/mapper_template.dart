import 'dart:io';

import '../../extensions/to_pascal_case.dart';

mapperTemplate(String moduleName, Directory mapperDir) {
  String className = moduleName.toPascalCase();
  String template = """
class ${className}Mapper {

}
""";

  var file = File('${mapperDir.path}/${moduleName}_mapper.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
