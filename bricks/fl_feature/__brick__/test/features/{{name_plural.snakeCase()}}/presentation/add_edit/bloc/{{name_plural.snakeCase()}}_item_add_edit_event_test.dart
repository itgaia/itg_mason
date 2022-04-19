import 'package:flutter_test/flutter_test.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart';

void main() {
  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent', () {
    //** fields start **//
    {{#fields}}group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEdit{{#pascalCase}}{{field_name}}{{/pascalCase}}ChangedEvent', () {
      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAECE {{#camelCase}}{{field_name}}{{/camelCase}} supports value equality', () {
        expect(
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEdit{{#pascalCase}}{{field_name}}{{/pascalCase}}ChangedEvent('{{#camelCase}}{{field_name}}{{/camelCase}}'),
          equals(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEdit{{#pascalCase}}{{field_name}}{{/pascalCase}}ChangedEvent('{{#camelCase}}{{field_name}}{{/camelCase}}')),
        );
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAECE {{#camelCase}}{{field_name}}{{/camelCase}} props are correct', () {
        expect(
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEdit{{#pascalCase}}{{field_name}}{{/pascalCase}}ChangedEvent('{{#camelCase}}{{field_name}}{{/camelCase}}').props,
          equals(<Object?>['{{#camelCase}}{{field_name}}{{/camelCase}}']),
        );
      });
    });{{^is_last}}

    {{/is_last}}{{/fields}}
    //** fields end **//

    group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent', () {
      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAECE submitted supports value equality', () {
        expect(
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent(),
          equals(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent()),
        );
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAECE submitted props are correct', () {
        expect(
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent().props,
          equals(<Object?>[]),
        );
      });
    });
  });
}