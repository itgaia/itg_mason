import 'package:flutter_test/flutter_test.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart';

void main() {
  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent', () {
    group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent', () {
      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAECE code supports value equality', () {
        expect(
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent('description'),
          equals(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent('description')),
        );
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAECE code props are correct', () {
        expect(
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent('description').props,
          equals(<Object?>['description']),
        );
      });
    });

    group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent', () {
      group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent', () {
        test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAECE code supports value equality', () {
          expect(
            const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent('description'),
            equals(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent('description')),
          );
        });

        test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAECE code props are correct', () {
          expect(
            const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent('description').props,
            equals(<Object?>['description']),
          );
        });
      });

      group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditContentChangedEvent', () {
        test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAECE {{#snakeCase}}{{name_plural}}{{/snakeCase}} supports value equality', () {
          expect(
            const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditContentChangedEvent('content'),
            equals(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditContentChangedEvent('content')),
          );
        });

        test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAECE {{#snakeCase}}{{name_plural}}{{/snakeCase}} props are correct', () {
          expect(
            const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditContentChangedEvent('content').props,
            equals(<Object?>['content']),
          );
        });
      });

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
  });
}