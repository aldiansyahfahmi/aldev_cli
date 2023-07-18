import 'dart:io';

import '../../../../../../extensions/to_pascal_case.dart';

remoteDataSourceTemplate(String moduleName, Directory dir) {
  String template = """
import 'package:dio/dio.dart';
import '../../../shared_libraries/utils/constants/app_constants.dart';

abstract class ExampleRemoteDataSource {

}

class ExampleRemoteDataSourceImpl implements ExampleRemoteDataSource {
  final Dio dio = sl();
}

""";

  String className = moduleName.toPascalCase();
  String variableName = moduleName.toCamelCase();
  String lowerCaseWithUnderscore = moduleName.toLowerCaseWithUnderscore();
  template = template.replaceAll("Example", className);
  template = template.replaceAll("example", variableName);
  template = template.replaceAll("import_name", lowerCaseWithUnderscore);

  var file = File('${dir.path}/${moduleName}_remote_datasource.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
