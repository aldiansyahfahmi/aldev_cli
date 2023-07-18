import 'dart:io';

mainDev(Directory dir) {
  String template = """
import 'package:flutter/material.dart';
import '../di/injections.dart';
import '../main_app.dart';
import '../app/shared_libraries/utils/setup/app_setup.dart';

void main() async {
  Config.appFlavor = Flavor.dev;
  WidgetsFlutterBinding.ensureInitialized();
  await Injections().initialize();
  runApp(const MyApp());
}


""";

  var file = File('${dir.path}/main_dev.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
