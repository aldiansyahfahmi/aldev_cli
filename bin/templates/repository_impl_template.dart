import 'dart:io';

import '../extensions/to_pascal_case.dart';

repositoryImplTemplate(String moduleName, Directory dir) {
  String className = moduleName.toPascalCase();
  String template = """
import 'package:$moduleName/domain/repository/${moduleName}_repository.dart';
import 'package:$moduleName/data/datasource/local/${moduleName}_local_datasource.dart';
import 'package:$moduleName/data/datasource/remote/${moduleName}_remote_datasource.dart';
import 'package:$moduleName/data/mapper/${moduleName}_mapper.dart';

class ${className}RepositoryImpl implements ${className}Repository{
  final ${className}LocalDataSources localDataSources;
  final ${className}RemoteDataSource remoteDataSource;
  final ${className}Mapper mapper;

  ${className}RepositoryImpl({
    required this.localDataSources,
    required this.remoteDataSource,
    required this.mapper,
  });

}
""";

  var file = File('${dir.path}/${moduleName}_repository_impl.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
