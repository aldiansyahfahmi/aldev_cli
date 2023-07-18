import 'dart:io';

import '../templates/di/dependency_injections.dart';
import '../templates/launcher/main_dev.dart';
import '../templates/launcher/main_prod.dart';
import '../templates/main_template.dart';
import '../templates/presentation/ui_template.dart';
import '../templates/shared_libraries/core/models/api_response.dart';
import '../templates/shared_libraries/utils/constants/app_constants.dart';
import '../templates/shared_libraries/core/api_interceptors.dart';
import '../templates/shared_libraries/core/dio_handler.dart';
import '../templates/shared_libraries/utils/error/exception.dart';
import '../templates/shared_libraries/utils/error/failure_response.dart';
import '../templates/shared_libraries/utils/navigation/navigation_helper.dart';
import '../templates/shared_libraries/utils/navigation/router/app_routes.dart';
import '../templates/shared_libraries/utils/navigation/router/home_router.dart';
import '../templates/shared_libraries/utils/setup/app_setup.dart';
import '../templates/shared_libraries/utils/state/view_data_state.dart';

class InitGenerator {
  static generate() async {
    // MAIN
    var mainDir = Directory('./lib');
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

    // DOMAIN
    var remoteDataSourceDir = Directory('./lib/app/domain/datasource/remote/');
    var localDataSourceDir = Directory('./lib/app/domain/datasource/local/');
    var responseModelDir = Directory('./lib/app/domain/models/response/');
    var bodyModelDir = Directory('./lib/app/domain/models/body/');
    var remoteRepositoryDir = Directory('./lib/app/domain/repository/remote/');
    var localRepositoryDir = Directory('./lib/app/domain/repository/local/');

    remoteDataSourceDir.createSync(recursive: true);
    localDataSourceDir.createSync(recursive: true);
    responseModelDir.createSync(recursive: true);
    bodyModelDir.createSync(recursive: true);
    remoteRepositoryDir.createSync(recursive: true);
    localRepositoryDir.createSync(recursive: true);

    // PRESENTATION
    var blocPresentationDir = Directory('./lib/app/presentation/home/bloc/');
    var uiPresentationDir = Directory('./lib/app/presentation/home/ui/');

    blocPresentationDir.createSync(recursive: true);
    uiPresentationDir.createSync(recursive: true);

    uiTemplate('home', uiPresentationDir);

    // SHARED LIBRARIES
    var componentSharedLibrariesDir =
        Directory('./lib/app/shared_libraries/component');
    var coreSharedLibrariesDir = Directory('./lib/app/shared_libraries/core');
    var coreModelsSharedLibrariesDir =
        Directory('./lib/app/shared_libraries/core/models');
    var utilsSharedLibrariesDir = Directory('./lib/app/shared_libraries/utils');
    var constantsSharedLibrariesDir =
        Directory('./lib/app/shared_libraries/utils/constants');
    var errorSharedLibrariesDir =
        Directory('./lib/app/shared_libraries/utils/error');
    var navigationSharedLibrariesDir =
        Directory('./lib/app/shared_libraries/utils/navigation/');
    var navigationRouterSharedLibrariesDir =
        Directory('./lib/app/shared_libraries/utils/navigation/router/');
    var navigationArgumentSharedLibrariesDir =
        Directory('./lib/app/shared_libraries/utils/navigation/argument/');
    var setupSharedLibrariesDir =
        Directory('./lib/app/shared_libraries/utils/setup/');
    var stateSharedLibrariesDir =
        Directory('./lib/app/shared_libraries/utils/state/');

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
