import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/constants.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/common/helper.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('item{{#pascalCase}}{{name_plural}}{{/pascalCase}}ObjectAsString', () {
    const item = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(id: '1', {{#fields}}{{#camelCase}}{{field_name}}{{/camelCase}}: 'sample {{#camelCase}}{{field_name}}{{/camelCase}} 1'{{^is_last}}, {{/is_last}}{{/fields}});
    final expected = {
      useMongoDbBackendFor{{#pascalCase}}{{name_plural}}{{/pascalCase}} ? '_id' : 'id': useMongoDbBackendFor{{#pascalCase}}{{name_plural}}{{/pascalCase}} ? buildIdMapForMongoDb('1') : '1',
      {{#fields}}'{{#camelCase}}{{field_name}}{{/camelCase}}': 'sample {{#camelCase}}{{field_name}}{{/camelCase}} 1',{{^is_last}}
      {{/is_last}}{{/fields}}
      'createdAt': '',
      'updatedAt': ''
    };
    final expectedOmitEmpty = {
      useMongoDbBackendFor{{#pascalCase}}{{name_plural}}{{/pascalCase}} ? '_id' : 'id': useMongoDbBackendFor{{#pascalCase}}{{name_plural}}{{/pascalCase}} ? buildIdMapForMongoDb('1') : '1',
      {{#fields}}'{{#camelCase}}{{field_name}}{{/camelCase}}': 'sample {{#camelCase}}{{field_name}}{{/camelCase}} 1',{{^is_last}}
      {{/is_last}}{{/fields}}
    };

    test('item{{#pascalCase}}{{name_plural}}{{/pascalCase}}ObjectAsString returns valid', () {
      expect(item{{#pascalCase}}{{name_plural}}{{/pascalCase}}ObjectAsString(item), equals(expectedOmitEmpty));
      expect(item{{#pascalCase}}{{name_plural}}{{/pascalCase}}ObjectAsString(item, omitEmpty: false), equals(expected));
    });
  });

  group('getIdForTesting', () {
    test('getIdForTesting - valid results', () {
      final bool prvUseMongoDbBackend = useMongoDbBackendFor{{#pascalCase}}{{name_plural}}{{/pascalCase}};
      useMongoDbBackendFor{{#pascalCase}}{{name_plural}}{{/pascalCase}} = false;
      expect(getIdForTesting(''), equals(''));
      expect(getIdForTesting('2'), equals('2'));
      expect(getIdForTesting('29'), equals('29'));
      useMongoDbBackendFor{{#pascalCase}}{{name_plural}}{{/pascalCase}} = prvUseMongoDbBackend;
    });

    test('getIdForTesting - mongoDb valid results', () {
      final bool prvUseMongoDbBackend = useMongoDbBackendFor{{#pascalCase}}{{name_plural}}{{/pascalCase}};
      useMongoDbBackendFor{{#pascalCase}}{{name_plural}}{{/pascalCase}} = true;
      expect(getIdForTesting(''), equals(sampleIdForMongoDb));
      expect(getIdForTesting(''), equals('61011f6d4558ebe4f88abc1'));
      expect(getIdForTesting('2'), equals('61011f6d4558ebe4f88abc2'));
      expect(getIdForTesting('29'), equals('61011f6d4558ebe4f88ab29'));
      useMongoDbBackendFor{{#pascalCase}}{{name_plural}}{{/pascalCase}} = prvUseMongoDbBackend;
    });
  });
}