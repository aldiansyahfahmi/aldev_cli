import 'dart:io';

import '../templates/features/cubit/cubit_template.dart';
import '../templates/features/cubit/state_template.dart';

class CubitGenerator {
  static generate(String value) async {
    String moduleName = value.split('/')[0];

    var blocDir = Directory('./lib/presentation/bloc/${moduleName}_cubit');

    blocDir.createSync(recursive: true);

    cubitTemplate(moduleName, blocDir);
    stateTemplate(moduleName, blocDir);
  }
}
