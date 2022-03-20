import 'dart:convert';

import 'package:dev_framework_tutorial/src/app/constants.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_helper.dart';
import '../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  final t{{#pascalCase}}{{name_plural}}{{/pascalCase}} = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData(count: 3);

  test(
    'should be a subclass of {{#pascalCase}}{{name_plural}}{{/pascalCase}} entity',
        () async {
      expect(t{{#pascalCase}}{{name_plural}}{{/pascalCase}}.first, isA<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>());
    },
  );

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      final jsonData = useMongoDbBackend
        ? fixture('{{#snakeCase}}{{name_plural}}{{/snakeCase}}_mongo_fixture.json')
        : fixture('{{#snakeCase}}{{name_plural}}{{/snakeCase}}_fixture.json');
      final result = (json.decode(jsonData) as List)
        .map<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>((json) => {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model.fromJson(json)).toList();
      expect(result, t{{#pascalCase}}{{name_plural}}{{/pascalCase}});
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      final expectedJsonMap = useMongoDbBackend
        ? {{#snakeCase}}{{name_plural}}{{/snakeCase}}MongoTestMapData(count: t{{#pascalCase}}{{name_plural}}{{/pascalCase}}.length)
        : {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestMapData(count: t{{#pascalCase}}{{name_plural}}{{/pascalCase}}.length);
      final result = t{{#pascalCase}}{{name_plural}}{{/pascalCase}}.map(({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {{#snakeCase}}{{name_singular}}{{/snakeCase}}) => {{#snakeCase}}{{name_singular}}{{/snakeCase}}.toJson()).toList();
      expect(result, expectedJsonMap);
    });

    test('should return correct data - omit if null or empty', () {
      const item = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(description: 'description1');
      final result = item.toJson();
      expect(result, equals({'description': 'description1'}));
    });
  });
}
