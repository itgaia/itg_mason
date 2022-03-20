import 'package:flutter_test/flutter_test.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart';

void main() {
  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState', () {
    const mockInitialData = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
      id: '1',
      description: 'description 1',
      content: 'content 1',
    );

    {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState createSubject({
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus status = {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.initial,
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model? initialData,
      String id = '',
      String description = '',
      String content = '',
    }) {
      return {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
        status: status,
        initialData: initialData,
        description: description,
        content: content,
      );
    }

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAES supports value equality', () {
      expect(createSubject(), equals(createSubject()));
    });

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAES props are correct', () {
      expect(
        createSubject(
          status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.initial,
          initialData: mockInitialData,
          id: '',
          description: 'description',
          content: 'content',
        ).props,
        equals(<Object?>[
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.initial,
          mockInitialData,
          '',
          'description',
          'content',
        ]),
      );
    });

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAES isNew returns true when a new item is being created', () {
      expect(createSubject(initialData: null).isNew, isTrue);
    });

    group('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAES copyWith', () {
      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAES copyWith returns the same object if not arguments are provided', () {
        expect(createSubject().copyWith(), equals(createSubject()));
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAES copyWith retains the old value for every parameter if null is provided', () {
        expect(
          createSubject().copyWith(
            status: null,
            initialData: null,
            description: null,
            content: null,
          ),
          equals(createSubject()),
        );
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAES copyWith replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
            status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.success,
            initialData: mockInitialData,
            description: 'description',
            content: 'content',
          ),
          equals(
            createSubject(
              status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.success,
              initialData: mockInitialData,
              description: 'description',
              content: 'content',
            ),
          ),
        );
      });
    });
  });
}
