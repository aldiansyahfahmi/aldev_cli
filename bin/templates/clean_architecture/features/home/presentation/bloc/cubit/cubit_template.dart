import 'dart:io';

import '../../../../../../../extensions/to_pascal_case.dart';

cubitTemplate(String moduleName, Directory dir) {
  String template = """
import 'package:bloc/bloc.dart';
import '../../../../shared_libraries/utils/state/view_data_state.dart';
import 'import_name_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  final ExampleRepository exampleRepository;

  ExampleCubit({required this.exampleRepository}) 
      : super(ExampleState(exampleState: ViewData.initial()));
}

""";

  String className = moduleName.toPascalCase();
  String variableName = moduleName.toCamelCase();
  String lowerCaseWithUnderscore = moduleName.toLowerCaseWithUnderscore();
  template = template.replaceAll("Example", className);
  template = template.replaceAll("example", variableName);
  template = template.replaceAll("import_name", lowerCaseWithUnderscore);

  var file = File('${dir.path}/${moduleName}_cubit.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
