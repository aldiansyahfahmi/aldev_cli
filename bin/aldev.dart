import 'dart:io';

import 'generators/bloc_generator.dart';
import 'generators/cubit_generator.dart';
import 'generators/domain_generator.dart';
import 'generators/presentation_generator.dart';
import 'generators/init_generator.dart';

void main(List<String> arguments) {
  var command = arguments[0];
  var value = '';
  if (arguments.length > 1) {
    value = arguments[1];
  }

  switch (command) {
    case 'init':
      stdout.write('Anda yakin ingin menjalankan ini? (Y/N) : ');
      String input = stdin.readLineSync()?.toUpperCase() ?? '';
      if (input == 'Y') {
        InitGenerator.generate();
        print('Selesai');
      } else {
        print('Dibatalkan');
      }
      break;
    case 'domain':
      var domainName = arguments[2];
      if (value == 'remote' || value == 'local') {
        DomainGenerator.generate(value, domainName);
      } else {
        print('$value: command not found');
      }
      break;
    case 'presentation':
      PresentationGenerator.generate(value);
      break;
    case 'cubit':
      var cubitName = arguments[2];
      CubitGenerator.generate(value, cubitName);
      break;
    case 'bloc':
      var blocName = arguments[2];
      BlocGenerator.generate(value, blocName);
      break;
    default:
      print('$command: command not found');
  }
}
