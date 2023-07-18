import 'dart:io';

import '../templates/presentation/bloc/bloc_template.dart';
import '../templates/presentation/bloc/event_template.dart';
import '../templates/presentation/bloc/state_template.dart';

class BlocGenerator {
  static generate(String value, String folderName) async {
    var blocDir =
        Directory('./lib/presentation/$value/bloc/${folderName}_bloc');

    blocDir.createSync(recursive: true);

    blocTemplate(folderName, blocDir);
    eventTemplate(folderName, blocDir);
    stateTemplate(folderName, blocDir);
  }
}
