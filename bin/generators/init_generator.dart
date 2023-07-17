import 'dart:io';

import '../templates/features/ui_template.dart';
import '../templates/shared_libraries/constants/app_constants.dart';
import '../templates/shared_libraries/core/api_interceptors.dart';
import '../templates/shared_libraries/core/dio_handler.dart';

class InitGenerator {
  static generate() async {
    // DOMAIN
    var remoteDataSourceDir = Directory('./lib/domain/datasource/remote/');
    var localDataSourceDir = Directory('./lib/domain/datasource/local/');
    var responseModelDir = Directory('./lib/domain/models/response/');
    var bodyModelDir = Directory('./lib/domain/models/body/');
    var remoteRepositoryDir = Directory('./lib/domain/repository/remote/');
    var localRepositoryDir = Directory('./lib/domain/repository/local/');

    remoteDataSourceDir.createSync(recursive: true);
    localDataSourceDir.createSync(recursive: true);
    responseModelDir.createSync(recursive: true);
    bodyModelDir.createSync(recursive: true);
    remoteRepositoryDir.createSync(recursive: true);
    localRepositoryDir.createSync(recursive: true);

    // PRESENTATION
    var blocPresentationDir = Directory('./lib/presentation/home/bloc/');
    var uiPresentationDir = Directory('./lib/presentation/home/ui/');

    blocPresentationDir.createSync(recursive: true);
    uiPresentationDir.createSync(recursive: true);

    uiTemplate('home', uiPresentationDir);

    // SHARED LIBRARIES
    var componentSharedLibrariesDir =
        Directory('./lib/shared_libraries/component');
    var coreSharedLibrariesDir = Directory('./lib/shared_libraries/core');
    var utilsSharedLibrariesDir = Directory('./lib/shared_libraries/utils');
    var constantsSharedLibrariesDir =
        Directory('./lib/shared_libraries/utils/constants');

    componentSharedLibrariesDir.createSync(recursive: true);
    coreSharedLibrariesDir.createSync(recursive: true);
    utilsSharedLibrariesDir.createSync(recursive: true);
    constantsSharedLibrariesDir.createSync(recursive: true);

    apiInterceptors(coreSharedLibrariesDir);
    dioHandler(coreSharedLibrariesDir);
    appConstants(constantsSharedLibrariesDir);
  }
}
