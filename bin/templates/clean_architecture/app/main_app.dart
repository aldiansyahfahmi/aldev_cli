import 'dart:io';

mainApp(Directory dir) {
  String template = """
import 'package:flutter/material.dart';
import '../shared_libraries/utils/constants/app_constants.dart';
import '../shared_libraries/utils/navigation/navigation_helper.dart';
import '../shared_libraries/utils/setup/app_setup.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.app.appName,
      debugShowCheckedModeBanner: Config.isDebug,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        );
      },
      navigatorKey: NavigationHelperImpl.navigatorKey,
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(context, child, details) {
    return child;
  }
}

""";

  var file = File('${dir.path}/main_app.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
