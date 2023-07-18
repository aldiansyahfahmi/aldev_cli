import 'dart:io';

import '../directory/directory.dart';
import '../templates/clean_architecture/features/home/presentation/ui/ui_template.dart';

class FeatureGenerator {
  static generate(String value) async {
    // FEATURES
    var localDatasourceDir = Directory(localDatasource(value));
    var remoteDatasourceDir = Directory(remoteDatasource(value));
    var bodyModelDir = Directory(bodyModel(value));
    var responseModelDir = Directory(responseModel(value));
    var repositoriesDir = Directory(dataRepositories(value));
    var mapperDir = Directory(mapper(value));
    var bodyEntitiesDir = Directory(bodyEntities(value));
    var responseEntitiesDir = Directory(responseEntities(value));
    var domainRepositoriesDir = Directory(domainRepositories(value));
    var usecaseDir = Directory(usecase(value));
    var blocDir = Directory(bloc(value));
    var uiDir = Directory(ui(value));

    localDatasourceDir.createSync(recursive: true);
    remoteDatasourceDir.createSync(recursive: true);
    bodyModelDir.createSync(recursive: true);
    responseModelDir.createSync(recursive: true);
    repositoriesDir.createSync(recursive: true);
    mapperDir.createSync(recursive: true);
    bodyEntitiesDir.createSync(recursive: true);
    responseEntitiesDir.createSync(recursive: true);
    domainRepositoriesDir.createSync(recursive: true);
    usecaseDir.createSync(recursive: true);
    blocDir.createSync(recursive: true);
    uiDir.createSync(recursive: true);

    uiTemplate(value, uiDir);
  }
}
