import 'dart:io';

import '../templates/features/ui_template.dart';

class FeatureGenerator {
  static generate(String value) async {
    String moduleName = value.split('/')[0];

    var blocDir = Directory('./lib/presentation/bloc/');
    var uiDir = Directory('./lib/presentation/ui/');

    blocDir.createSync(recursive: true);
    uiDir.createSync(recursive: true);

    uiTemplate(moduleName, uiDir);
  }
}
