import 'dart:io';

import '../../../extensions/to_pascal_case.dart';

blocTemplate(String moduleName, Directory dir) {
  String template = """
import './import_name_event.dart';
import './import_name_state.dart';

class ExampleBloc
    extends Bloc<ExampleEvent, ExampleState> {
  final ExampleUseCase useCase;

  ExampleBloc({
    required this.useCase,
  }) : super(
          ExampleState(
            state: ViewData.initial(),
          ),
        ) {
    on<Example>((event, emit) async {});
  }
}
""";

  String className = moduleName.toPascalCase();
  String variableName = moduleName.toCamelCase();
  String lowerCaseWithUnderscore = moduleName.toLowerCaseWithUnderscore();
  template = template.replaceAll("Example", className);
  template = template.replaceAll("example", variableName);
  template = template.replaceAll("import_name", lowerCaseWithUnderscore);

  var file = File('${dir.path}/${moduleName}_bloc.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
