import 'dart:io';

import '../../../extensions/to_pascal_case.dart';

repositoryTemplate(String moduleName, Directory dir) {
  String template = """
import '../../datasource/remote/example_remote_datasource.dart';

abstract class ExampleRemoteRepository {

}

class ExampleRemoteRepositoryImpl implements ExampleRemoteRepository {
  final ExampleRemoteDataSource exampleRemoteDataSource = ExampleRemoteDataSourceImpl();
  
}


""";

  String className = moduleName.toPascalCase();
  String variableName = moduleName.toCamelCase();
  String lowerCaseWithUnderscore = moduleName.toLowerCaseWithUnderscore();
  template = template.replaceAll("Example", className);
  template = template.replaceAll("example", variableName);
  template = template.replaceAll("import_name", lowerCaseWithUnderscore);

  var file = File('${dir.path}/${moduleName}_remote_repository.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
