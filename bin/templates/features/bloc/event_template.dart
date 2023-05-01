import 'dart:io';

import '../../../extensions/to_pascal_case.dart';

eventTemplate(String moduleName, Directory dir) {
  String template = """
abstract class ExampleEvent extends Equatable {
  const ExampleEvent();
}

class Example extends ExampleEvent {
  final ExampleRequestEntity exampleRequestEntity;

  const Example({required this.exampleRequestEntity});

  @override
  List<Object?> get props => [exampleRequestEntity];
}
""";

  String className = moduleName.toPascalCase();
  String variableName = moduleName.toCamelCase();
  String lowerCaseWithUnderscore = moduleName.toLowerCaseWithUnderscore();
  template = template.replaceAll("Example", className);
  template = template.replaceAll("example", variableName);
  template = template.replaceAll("import_name", lowerCaseWithUnderscore);

  var file = File('${dir.path}/${moduleName}_event.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
