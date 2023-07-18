import 'dart:io';

import '../directory/directory.dart';
import '../templates/standart/domains/local_datasource_template.dart';
import '../templates/standart/domains/local_repository_template.dart';
import '../templates/standart/domains/remote_datasource_template.dart';
import '../templates/standart/domains/remote_repository_template.dart';

class DomainGenerator {
  static generate(String value, String domainName) async {
    // DATASOURCE
    var remoteDataSourceDir = Directory('$domainDir/datasource/remote/');
    var localDataSourceDir = Directory('$domainDir/datasource/local/');
    var remoteRepositoryDir = Directory('$domainDir/repository/remote/');
    var localRepositoryDir = Directory('$domainDir/repository/local/');

    remoteDataSourceDir.createSync(recursive: true);
    localDataSourceDir.createSync(recursive: true);
    remoteRepositoryDir.createSync(recursive: true);
    localRepositoryDir.createSync(recursive: true);

    if (value == 'remote') {
      remoteDataSourceTemplate(domainName, remoteDataSourceDir);
      remoteRepositoryTemplate(domainName, remoteRepositoryDir);
    } else if (value == 'local') {
      localDatasourceTemplate(domainName, localDataSourceDir);
      localRepositoryTemplate(domainName, localRepositoryDir);
    }
  }
}
