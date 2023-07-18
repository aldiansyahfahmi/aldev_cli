import 'dart:io';

import 'generators/bloc_generator.dart';
import 'generators/cubit_generator.dart';
import 'generators/domain_generator.dart';
import 'generators/feature_generator.dart';
import 'generators/init/clean_architecture.dart';
import 'generators/init/standart.dart';
import 'generators/presentation_generator.dart';

void main(List<String> arguments) {
  var command = arguments[0];
  var value = '';
  if (arguments.length > 1) {
    value = arguments[1];
  }

  switch (command) {
    case 'init':
      stdout.write('1. Standart | 2. Clean Architecture : (1 / 2) : ');
      String type = stdin.readLineSync() ?? '';
      if (type == '1') {
        print('Standart');
        stdout.write('Anda yakin ingin menjalankan ini? (Y/N) : ');
        String input = stdin.readLineSync()?.toUpperCase() ?? '';
        if (input == 'Y') {
          InitStandartGenerator.generate();
          print('Selesai');
        } else {
          print('Dibatalkan');
        }
      } else if (type == '2') {
        print('Clean Architecture');
        stdout.write('Anda yakin ingin menjalankan ini? (Y/N) : ');
        String input = stdin.readLineSync()?.toUpperCase() ?? '';
        if (input == 'Y') {
          InitCleanArchGenerator.generate();
          print('Selesai');
        } else {
          print('Dibatalkan');
        }
      } else {
        print('Command not found');
      }
      break;
    case 'feature':
      FeatureGenerator.generate(value);
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
      if (arguments.length > 2) {
        var presentationName = arguments[2];
        PresentationGenerator.generate(value, presentationName);
      } else {
        PresentationGenerator.generate(value, '');
      }
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
