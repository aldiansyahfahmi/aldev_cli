import 'dart:io';

import '../templates/domains/local_datasource_template.dart';
import '../templates/domains/local_repository_template.dart';
import '../templates/domains/remote_datasource_template.dart';
import '../templates/domains/remote_repository_template.dart';

class DomainGenerator {
  static generate(String value, String domainName) async {
    // DATASOURCE
    var remoteDataSourceDir = Directory('./lib/app/domain/datasource/remote/');
    var localDataSourceDir = Directory('./lib/app/domain/datasource/local/');
    var remoteRepositoryDir = Directory('./lib/app/domain/repository/remote/');
    var localRepositoryDir = Directory('./lib/app/domain/repository/local/');

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
