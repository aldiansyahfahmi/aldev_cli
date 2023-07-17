import 'dart:io';

import '../templates/features/ui_template.dart';

class PresentationGenerator {
  static generate(String value) async {
    var blocDir = Directory('./lib/presentation/$value/bloc/');
    var uiDir = Directory('./lib/presentation/$value/ui/');

    blocDir.createSync(recursive: true);
    uiDir.createSync(recursive: true);

    uiTemplate(value, uiDir);
  }
}
