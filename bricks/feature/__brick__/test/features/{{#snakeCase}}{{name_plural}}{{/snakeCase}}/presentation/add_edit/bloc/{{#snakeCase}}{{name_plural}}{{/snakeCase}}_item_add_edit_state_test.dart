import 'package:flutter_test/flutter_test.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart';

import '../../../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState', () {
    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAES supports value equality', () {
      expect(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(), equals(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState()));
    });

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAES props are correct', () {
      expect(
        sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
          status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.initial,
          initialData: sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemInitialData,
        ).props,
        equals(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStateObjectList),
      );
    });

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAES isNew returns true when a new item is being created', () {
      expect(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(initialData: null).isNew, isTrue);
    });

    group('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAES copyWith', () {
      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAES copyWith returns the same object if not arguments are provided', () {
        expect(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState().copyWith(), equals(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState()));
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAES copyWith retains the old value for every parameter if null is provided', () {
        expect(
          sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState().copyWith(
            status: null,
            initialData: null,
            {{#fields}}{{#camelCase}}{{field_name}}{{/camelCase}}: null,{{^is_last}}
            {{/is_last}}{{/fields}}
          ),
          equals(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState()),
        );
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAES copyWith replaces every non-null parameter', () {
        expect(
          sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState().copyWith(
            status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.success,
            initialData: sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemInitialData,
          ),
          equals(
            sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
              status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.success,
              initialData: sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemInitialData,
            ),
          ),
        );
      });
    });
  });
}
