import 'dart:io';

import '../../../extensions/to_pascal_case.dart';

stateTemplate(String moduleName, Directory dir) {
  String template = """
class ExampleState extends Equatable {
  final ViewData<ExampleDataEntity> exampleState;

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
