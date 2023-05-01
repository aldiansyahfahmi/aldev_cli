import 'dart:io';

import '../../extensions/to_pascal_case.dart';

repositoryTemplate(String moduleName, Directory dir) {
  String className = moduleName.toPascalCase();
  String template = """
abstract class ${className}Repository {
  const ${className}Repository();

}
""";

  var file = File('${dir.path}/${moduleName}_repository.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
