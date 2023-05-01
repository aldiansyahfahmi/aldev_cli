import 'dart:io';

import '../templates/features/bloc/bloc_template.dart';
import '../templates/features/bloc/event_template.dart';
import '../templates/features/bloc/state_template.dart';

class BlocGenerator {
  static generate(String value) async {
    String moduleName = value.split('/')[0];

    var blocDir = Directory('./lib/presentation/bloc/${moduleName}_bloc');

    blocDir.createSync(recursive: true);

    blocTemplate(moduleName, blocDir);
    eventTemplate(moduleName, blocDir);
    stateTemplate(moduleName, blocDir);
  }
}
