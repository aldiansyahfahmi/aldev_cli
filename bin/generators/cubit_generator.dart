import 'dart:io';

import '../templates/features/cubit/cubit_template.dart';
import '../templates/features/cubit/state_template.dart';

class CubitGenerator {
  static generate(String value, String cubitName) async {
    var cubitDir =
        Directory('./lib/presentation/$value/bloc/${cubitName}_cubit');

    cubitDir.createSync(recursive: true);

    cubitTemplate(cubitName, cubitDir);
    stateTemplate(cubitName, cubitDir);
  }
}
