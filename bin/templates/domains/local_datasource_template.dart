import 'dart:io';

import '../../extensions/to_pascal_case.dart';

localDatasourceTemplate(String moduleName, Directory dir) {
  String template = """
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared_libraries/utils/constants/app_constants.dart';

abstract class ExampleLocalDataSource {

}

class ExampleLocalDataSourceImpl implements ExampleLocalDataSource {
  final SharedPreferences sharedPreferences = sl();

}
""";

  String className = moduleName.toPascalCase();
  String variableName = moduleName.toCamelCase();
  String lowerCaseWithUnderscore = moduleName.toLowerCaseWithUnderscore();
  template = template.replaceAll("Example", className);
  template = template.replaceAll("example", variableName);
  template = template.replaceAll("import_name", lowerCaseWithUnderscore);

  var file = File('${dir.path}/${moduleName}_local_datasource.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
