import 'dart:io';

import '../../../extensions/to_pascal_case.dart';

stateTemplate(String moduleName, Directory dir) {
  String template = """
import 'package:equatable/equatable.dart';
import '../../../../shared_libraries/utils/state/view_data_state.dart';

class ExampleState extends Equatable {
  final ViewData<ExampleData> exampleState;

  const ExampleState({
    required this.exampleState,
  });

  @override
  List<Object?> get props => [exampleState];
}
""";

  String className = moduleName.toPascalCase();
  String variableName = moduleName.toCamelCase();
  String lowerCaseWithUnderscore = moduleName.toLowerCaseWithUnderscore();
  template = template.replaceAll("Example", className);
  template = template.replaceAll("example", variableName);
  template = template.replaceAll("import_name", lowerCaseWithUnderscore);

  var file = File('${dir.path}/${moduleName}_state.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
