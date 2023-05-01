import 'dart:io';

import '../../../extensions/to_pascal_case.dart';

stateTemplate(String moduleName, Directory dir) {
  String className = moduleName.toPascalCase();
  String template = """
class ${className}State extends Equatable {
  final ViewData<${className}DataEntity> ${moduleName}State;

  const ${className}State({
    required this.$moduleName,
  });

  @override
  List<Object?> get props => [${moduleName}State];
}
""";

  var file = File('${dir.path}/${moduleName}_state.dart');
  File(file.path).createSync();
  file.writeAsStringSync(template);
}
