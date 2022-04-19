import 'dart:convert';

import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/constants.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/common/helper.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_helper.dart';
import '../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  final t{{#pascalCase}}{{name_plural}}{{/pascalCase}} = {{#camelCase}}{{name_plural}}{{/camelCase}}TestData(count: 3);

  test(
    'should be a subclass of {{#pascalCase}}{{name_plural}}{{/pascalCase}} entity',
        () async {
      expect(t{{#pascalCase}}{{name_plural}}{{/pascalCase}}.first, isA<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>());
    },
  );

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      itgLogPrint('{{#pascalCase}}{{name_plural}}{{/pascalCase}} model - should return a valid model from JSON - useMongoDbBackend: $useMongoDbBackend');
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
        ? {{#camelCase}}{{name_plural}}{{/camelCase}}MongoTestMapData(count: t{{#pascalCase}}{{name_plural}}{{/pascalCase}}.length)
        : {{#camelCase}}{{name_plural}}{{/camelCase}}TestMapData(count: t{{#pascalCase}}{{name_plural}}{{/pascalCase}}.length);
      final result = t{{#pascalCase}}{{name_plural}}{{/pascalCase}}.map(({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {{#camelCase}}{{name_singular}}{{/camelCase}}) => {{#camelCase}}{{name_singular}}{{/camelCase}}.toJson()).toList();
      expect(result, expectedJsonMap);
    });

    test('should return correct data - omit if null or empty', () {
      final item = item{{#pascalCase}}{{name_plural}}{{/pascalCase}}Sample();
      final result = item.toJson();
      expect(result, equals(item{{#pascalCase}}{{name_plural}}{{/pascalCase}}ObjectAsString(item)));
    });
  });
}