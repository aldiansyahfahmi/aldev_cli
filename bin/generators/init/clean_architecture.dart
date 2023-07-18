import 'dart:io';

import '../../directory/directory.dart';
import '../../templates/clean_architecture/app/main_app.dart';
import '../../templates/clean_architecture/di/injections.dart';
import '../../templates/clean_architecture/features/home/presentation/ui/ui_template.dart';
import '../../templates/clean_architecture/launcher/main_dev.dart';
import '../../templates/clean_architecture/launcher/main_prod.dart';
import '../../templates/clean_architecture/shared_libraries/core/api_interceptors.dart';
import '../../templates/clean_architecture/shared_libraries/core/dio_handler.dart';
import '../../templates/clean_architecture/shared_libraries/core/models/api_response.dart';
import '../../templates/clean_architecture/shared_libraries/utils/constants/app_constants.dart';
import '../../templates/clean_architecture/shared_libraries/utils/error/exception.dart';
import '../../templates/clean_architecture/shared_libraries/utils/error/failure_response.dart';
import '../../templates/clean_architecture/shared_libraries/utils/navigation/navigation_helper.dart';
import '../../templates/clean_architecture/shared_libraries/utils/navigation/router/app_routes.dart';
import '../../templates/clean_architecture/shared_libraries/utils/navigation/router/home_router.dart';
import '../../templates/clean_architecture/shared_libraries/utils/setup/app_setup.dart';
import '../../templates/clean_architecture/shared_libraries/utils/state/view_data_state.dart';

class InitCleanArchGenerator {
  static generate() async {
    // APP
    var mainDir = Directory('./lib/app');
    mainDir.createSync(recursive: true);
    mainApp(mainDir);

    // INJECTION
    var injectionDir = Directory('./lib/di/');

    injectionDir.createSync(recursive: true);

    injection(injectionDir);

    // LAUNCHER
    var launcherDir = Directory('./lib/launcher/');

    launcherDir.createSync(recursive: true);

    mainDev(launcherDir);
    mainProd(launcherDir);

    // FEATURES
    var localDatasourceDir = Directory(localDatasource('home'));
    var remoteDatasourceDir = Directory(remoteDatasource('home'));
    var bodyModelDir = Directory(bodyModel('home'));
    var responseModelDir = Directory(responseModel('home'));
    var repositoriesDir = Directory(dataRepositories('home'));
    var mapperDir = Directory(mapper('home'));
    var bodyEntitiesDir = Directory(bodyEntities('home'));
    var responseEntitiesDir = Directory(responseEntities('home'));
    var domainRepositoriesDir = Directory(domainRepositories('home'));
    var usecaseDir = Directory(usecase('home'));
    var blocDir = Directory(bloc('home'));
    var uiDir = Directory(ui('home'));

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

    // localDatasourceTemplate('home', localDatasourceDir);
    // remoteDataSourceTemplate('home', remoteDatasourceDir);
    // repositoryTemplate('home', repositoriesDir);
    uiTemplate('home', uiDir);

    // SHARED LIBRARIES
    var componentSharedLibrariesDir = Directory('$sharedLibraries/component');
    var coreSharedLibrariesDir = Directory('$sharedLibraries/core/network');
    var coreModelsSharedLibrariesDir =
        Directory('$sharedLibraries/core/network/models');
    var utilsSharedLibrariesDir = Directory('$sharedLibraries/utils');
    var constantsSharedLibrariesDir =
        Directory('$sharedLibraries/utils/constants');
    var errorSharedLibrariesDir = Directory('$sharedLibraries/utils/error');
    var navigationSharedLibrariesDir =
        Directory('$sharedLibraries/utils/navigation/');
    var navigationRouterSharedLibrariesDir =
        Directory('$sharedLibraries/utils/navigation/router/');
    var navigationArgumentSharedLibrariesDir =
        Directory('$sharedLibraries/utils/navigation/argument/');
    var setupSharedLibrariesDir = Directory('$sharedLibraries/utils/setup/');
    var stateSharedLibrariesDir = Directory('$sharedLibraries/utils/state/');

    componentSharedLibrariesDir.createSync(recursive: true);
    coreSharedLibrariesDir.createSync(recursive: true);
    utilsSharedLibrariesDir.createSync(recursive: true);
    constantsSharedLibrariesDir.createSync(recursive: true);
    errorSharedLibrariesDir.createSync(recursive: true);
    navigationSharedLibrariesDir.createSync(recursive: true);
    navigationRouterSharedLibrariesDir.createSync(recursive: true);
    navigationArgumentSharedLibrariesDir.createSync(recursive: true);
    setupSharedLibrariesDir.createSync(recursive: true);
    stateSharedLibrariesDir.createSync(recursive: true);
    coreModelsSharedLibrariesDir.createSync(recursive: true);

    apiInterceptors(coreSharedLibrariesDir);
    dioHandler(coreSharedLibrariesDir);
    apiResponse(coreModelsSharedLibrariesDir);
    appConstants(constantsSharedLibrariesDir);
    navigationHelper(navigationSharedLibrariesDir);
    appRoutes(navigationRouterSharedLibrariesDir);
    homeRouter(navigationRouterSharedLibrariesDir);
    exception(errorSharedLibrariesDir);
    failureResponse(errorSharedLibrariesDir);
    appSetup(setupSharedLibrariesDir);
    viewDataState(stateSharedLibrariesDir);
  }
}
