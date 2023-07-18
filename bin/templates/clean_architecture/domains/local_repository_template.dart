import 'dart:io';

import '../../../extensions/to_pascal_case.dart';

localRepositoryTemplate(String moduleName, Directory dir) {
  String template = """
import '../../datasource/local/example_local_datasource.dart';

abstract class ExampleLocalRepository {

}

class ExampleLocalRepositoryImpl implements ExampleLocalRepository {
  final ExampleLocalDataSource exampleLocalDataSource = ExampleLocalDataSourceImpl();
  
}


""";

  String className = moduleName.toPascalCase();
  String variableName = moduleName.toCamelCase();
  String lowerCaseWithUnderscore = moduleName.toLowerCaseWithUnderscore();
  template = template.replaceAll("Example", className);
  template = template.replaceAll("example", variableName);
  template = template.replaceAll("import_name", lowerCaseWithUnderscore);

  var file = File('${dir.path}/${moduleName}_local_repository.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
