import 'dart:io';

import '../../extensions/to_pascal_case.dart';

remoteDataSourceTemplate(String moduleName, Directory remoteDataSourceDir) {
  String className = moduleName.toPascalCase();
  String template = """
import 'package:dependencies/dio/dio.dart';

abstract class ${className}RemoteDataSource {
  const ${className}RemoteDataSource();

}

class ${className}RemoteDataSourceImpl implements ${className}RemoteDataSource {
  final Dio dio;

  ${className}RemoteDataSourceImpl({required this.dio});

}
""";

  var file =
      File('${remoteDataSourceDir.path}/${moduleName}_remote_datasource.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
