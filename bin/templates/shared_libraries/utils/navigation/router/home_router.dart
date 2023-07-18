import 'dart:io';

homeRouter(Directory dir) {
  String template = """
import '../../navigation/navigation_helper.dart';
import 'app_routes.dart';

abstract class HomeRouter {
  void navigateToExampleScreen();
}

class HomeRouterImpl implements HomeRouter {
  NavigationHelper navigationHelper = NavigationHelperImpl();

  @override
  void navigateToExampleScreen() {
    navigationHelper.pushReplacementNamed(AppRoutes.example);
  }
}


""";

  var file = File('${dir.path}/home_router.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
