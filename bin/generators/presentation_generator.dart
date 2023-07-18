import 'dart:io';

import '../templates/presentation/ui_template.dart';

class PresentationGenerator {
  static generate(String value, String presentationName) async {
    late Directory blocDir;
    late Directory uiDir;

    if (presentationName.isEmpty) {
      blocDir = Directory('./lib/app/presentation/$value/bloc/');
      uiDir = Directory('./lib/app/presentation/$value/ui/');
    } else {
      blocDir =
          Directory('./lib/app/presentation/$value/$presentationName/bloc/');
      uiDir = Directory('./lib/app/presentation/$value/$presentationName/ui/');
    }

    blocDir.createSync(recursive: true);
    uiDir.createSync(recursive: true);

    if (presentationName.isEmpty) {
      uiTemplate(value, uiDir);
    } else {
      uiTemplate(presentationName, uiDir);
    }
  }
}
