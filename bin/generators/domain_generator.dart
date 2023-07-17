import 'dart:io';

import '../templates/domains/di_template.dart';
import '../templates/domains/local_datasource_template.dart';
import '../templates/domains/mapper_template.dart';
import '../templates/domains/remote_datasource_template.dart';
import '../templates/domains/repository_impl_template.dart';
import '../templates/domains/repository_template.dart';

class DomainGenerator {
  static generate(String value) async {
    // DATA
    var remoteDataSourceDir = Directory('./lib/data/datasource/remote/');
    var localDataSourceDir = Directory('./lib/data/datasource/local/');
    var mapperDir = Directory('./lib/data/mapper/');
    var responseModelDir = Directory('./lib/data/model/response/');
    var bodyModelDir = Directory('./lib/data/model/body/');
    var repositoryImplDir = Directory('./lib/data/repository/');

    remoteDataSourceDir.createSync(recursive: true);
    localDataSourceDir.createSync(recursive: true);
    mapperDir.createSync(recursive: true);
    responseModelDir.createSync(recursive: true);
    bodyModelDir.createSync(recursive: true);
    repositoryImplDir.createSync(recursive: true);

    // DI
    var diDir = Directory('./lib/di/');

    diDir.createSync(recursive: true);

    // DOMAIN
    var responseEntityDir = Directory('./lib/domain/entity/response/');
    var bodyEntityDir = Directory('./lib/domain/entity/body/');
    var repositoryDir = Directory('./lib/domain/repository/');
    var usecaseDir = Directory('./lib/domain/usecase/');

    responseEntityDir.createSync(recursive: true);
    bodyEntityDir.createSync(recursive: true);
    repositoryDir.createSync(recursive: true);
    usecaseDir.createSync(recursive: true);

    remoteDataSourceTemplate(value, remoteDataSourceDir);
    localDatasourceTemplate(value, localDataSourceDir);
    mapperTemplate(value, mapperDir);
    repositoryImplTemplate(value, repositoryImplDir);
    diTemplate(value, diDir);
    repositoryTemplate(value, repositoryDir);
  }
}
