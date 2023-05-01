import 'generators/domain_generator.dart';
import 'generators/feature_generator.dart';

void main(List<String> arguments) {
  var command = arguments[0];
  var value = arguments[1];

  switch (command) {
    case 'domain':
      DomainGenerator.generate(value);
      break;
    case 'feature':
      FeatureGenerator.generate(value);
      break;
    default:
  }
}
