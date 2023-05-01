import 'dart:io';

import '../../../extensions/to_pascal_case.dart';

cubitTemplate(String moduleName, Directory dir) {
  String className = moduleName.toPascalCase();
  String template = """
class ${className}Cubit extends Cubit<${className}State> {
  final YourUseCase useCase;

  ${className}Cubit({required this.usecase}) 
      : super(${className}State(${moduleName}State: ViewData.initial()));
}

""";

  var file = File('${dir.path}/${moduleName}_cubit.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
