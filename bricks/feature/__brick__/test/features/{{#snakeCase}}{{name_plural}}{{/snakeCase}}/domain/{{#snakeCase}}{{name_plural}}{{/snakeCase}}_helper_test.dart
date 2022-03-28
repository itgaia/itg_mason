import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('item{{#pascalCase}}{{name_plural}}{{/pascalCase}}ObjectAsString', () {
    const item = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(id: '1', {{#fields}}{{#camelCase}}{{field_name}}{{/camelCase}}: 'sample {{#camelCase}}{{field_name}}{{/camelCase}} 1'{{^is_last}}, {{/is_last}}{{/fields}});
    const expected = {
      'id': '1',
      {{#fields}}'{{#camelCase}}{{field_name}}{{/camelCase}}': 'sample {{#camelCase}}{{field_name}}{{/camelCase}} 1',{{^is_last}}
      {{/is_last}}{{/fields}}
      'createdAt': '',
      'updatedAt': ''
    };
    const expectedOmitEmpty = {
      'id': '1',
      {{#fields}}'{{#camelCase}}{{field_name}}{{/camelCase}}': 'sample {{#camelCase}}{{field_name}}{{/camelCase}} 1',{{^is_last}}
      {{/is_last}}{{/fields}}
    };

    test('item{{#pascalCase}}{{name_plural}}{{/pascalCase}}ObjectAsString returns valid', () {
      expect(item{{#pascalCase}}{{name_plural}}{{/pascalCase}}ObjectAsString(item), equals(expectedOmitEmpty));
      expect(item{{#pascalCase}}{{name_plural}}{{/pascalCase}}ObjectAsString(item, omitEmpty: false), equals(expected));
    });
  });
}