import 'dart:io';

mainProd(Directory dir) {
  String template = """
import 'package:flutter/material.dart';
import '../di/injections.dart';
import '../app/main_app.dart';
import '../shared_libraries/utils/setup/app_setup.dart';

void main() async {
  Config.appFlavor = Flavor.prod;
  WidgetsFlutterBinding.ensureInitialized();
  await Injections().initialize();
  runApp(const MyApp());
}


""";

  var file = File('${dir.path}/main_prod.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
