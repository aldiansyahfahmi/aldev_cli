import 'dart:io';

import '../directory/directory.dart';
import '../templates/standart/presentation/cubit/cubit_template.dart';
import '../templates/standart/presentation/cubit/state_template.dart';

class CubitGenerator {
  static generate(String value, String cubitName) async {
    var cubitDir = Directory('$presentationDir/$value/bloc/${cubitName}_cubit');

    cubitDir.createSync(recursive: true);

    cubitTemplate(cubitName, cubitDir);
    stateTemplate(cubitName, cubitDir);
  }
}
