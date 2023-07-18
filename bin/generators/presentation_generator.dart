import 'dart:io';

import '../directory/directory.dart';
import '../templates/presentation/ui_template.dart';

class PresentationGenerator {
  static generate(String value, String presentationName) async {
    late Directory blocDir;
    late Directory uiDir;

    if (presentationName.isEmpty) {
      blocDir = Directory('$presentationDir/$value/bloc/');
      uiDir = Directory('$presentationDir/$value/ui/');
    } else {
      blocDir = Directory('$presentationDir/$value/$presentationName/bloc/');
      uiDir = Directory('$presentationDir/$value/$presentationName/ui/');
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
