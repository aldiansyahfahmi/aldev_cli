import 'dart:io';

import '../templates/features/cubit/cubit_template.dart';
import '../templates/features/cubit/state_template.dart';

class CubitGenerator {
  static generate(String value) async {
    String moduleName = value.split('/')[0];

    var cubitDir = Directory('./lib/presentation/bloc/${moduleName}_cubit');

    cubitDir.createSync(recursive: true);

    cubitTemplate(moduleName, cubitDir);
    stateTemplate(moduleName, cubitDir);
  }
}
