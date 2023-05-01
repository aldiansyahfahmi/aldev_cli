import 'dart:io';

import '../../extensions/to_pascal_case.dart';

repositoryImplTemplate(String moduleName, Directory dir) {
  String template = """
import '../../domain/repository/import_name_repository.dart';
import '../datasource/local/import_name_local_datasource.dart';
import '../datasource/remote/import_name_remote_datasource.dart';
import '../mapper/import_name_mapper.dart';

class ExampleRepositoryImpl implements ExampleRepository{
  final ExampleLocalDataSource localDataSources;
  final ExampleRemoteDataSource remoteDataSource;
  final ExampleMapper mapper;

  ExampleRepositoryImpl({
    required this.localDataSources,
    required this.remoteDataSource,
    required this.mapper,
  });

}
""";

  String className = moduleName.toPascalCase();
  String variableName = moduleName.toCamelCase();
  String lowerCaseWithUnderscore = moduleName.toLowerCaseWithUnderscore();
  template = template.replaceAll("Example", className);
  template = template.replaceAll("example", variableName);
  template = template.replaceAll("import_name", lowerCaseWithUnderscore);

  var file = File('${dir.path}/${moduleName}_repository_impl.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
