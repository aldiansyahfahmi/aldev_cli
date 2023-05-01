extension StringExtension on String {
  String toPascalCase() {
    var words = split(' ');
    var pascalCase = '';
    for (var word in words) {
      pascalCase += word[0].toUpperCase() + word.substring(1);
    }
    return pascalCase;
  }

  String toCamelCase() {
    var words = split(' ');
    var result = '';
    for (var i = 0; i < words.length; i++) {
      if (i == 0) {
        result += words[i].toLowerCase();
      } else {
        result += words[i].substring(0, 1).toUpperCase() +
            words[i].substring(1).toLowerCase();
      }
    }
    return result;
  }

  String toLowerCaseWithUnderscore() {
    return replaceAll(' ', '_').toLowerCase();
  }
}
