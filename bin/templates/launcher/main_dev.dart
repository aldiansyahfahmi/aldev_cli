import 'dart:io';

mainDev(Directory dir) {
  String template = """
import 'package:flutter/material.dart';
import '../di/dependency_injections.dart';
import '../main.dart';
import '../app/shared_libraries/utils/setup/app_setup.dart';

void main() async {
  Config.appFlavor = Flavor.dev;
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjections().initialize();
  runApp(const MyApp());
}


""";

  var file = File('${dir.path}/main_dev.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
