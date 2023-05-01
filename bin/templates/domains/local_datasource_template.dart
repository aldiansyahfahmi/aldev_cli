import 'dart:io';

import '../../extensions/to_pascal_case.dart';

localDatasourceTemplate(String moduleName, Directory localDataSourceDir) {
  String className = moduleName.toPascalCase();
  String template = """
import 'package:dependencies/shared_preferences/shared_preferences.dart';

abstract class ${className}LocalDataSource {
  const ${className}LocalDataSource();

}

class ${className}LocalDataSourceImpl implements ${className}LocalDataSource {
  final SharedPreferences sharedPreferences;

  ${className}LocalDataSourceImpl({required this.sharedPreferences});

}
""";

  var file =
      File('${localDataSourceDir.path}/${moduleName}_local_datasource.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
