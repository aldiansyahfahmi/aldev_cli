import 'dart:io';

import '../../extensions/to_pascal_case.dart';

uiTemplate(String moduleName, Directory dir) {
  String className = moduleName.toPascalCase();
  String template = """
import 'package:flutter/material.dart';

class ${className}Screen extends StatelessWidget {
  const ${className}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('${className}Screen'),
      ),
    );
  }
}

""";

  var file = File('${dir.path}/${moduleName}_screen.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
