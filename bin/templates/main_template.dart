import 'dart:io';

mainApp(Directory dir) {
  String template = """
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
""";

  var file = File('${dir.path}/main.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
