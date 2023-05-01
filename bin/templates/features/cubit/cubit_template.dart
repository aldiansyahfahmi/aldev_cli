import 'dart:io';

import '../../../extensions/to_pascal_case.dart';

cubitTemplate(String moduleName, Directory dir) {
  String template = """
import '../import_name_bloc/import_name_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  final ExampleUseCase exampleUseCase;

  ExampleCubit({required this.exampleUseCase}) 
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
