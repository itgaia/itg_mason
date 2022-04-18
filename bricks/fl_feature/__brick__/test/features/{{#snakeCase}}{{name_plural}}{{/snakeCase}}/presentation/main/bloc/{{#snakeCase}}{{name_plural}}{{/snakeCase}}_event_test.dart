import 'package:flutter_test/flutter_test.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_bloc.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_list_filter.dart';

import '../../../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}Event', () {
    final tItem = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData().first;

    group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent', () {
      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}SRE supports value equality', () {
        expect(
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent(),
          equals(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent()),
        );
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}SRE props are correct', () {
        expect(
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent().props,
          equals(<Object?>[]),
        );
      });
    });

    group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSavedEvent', () {
      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}ISE supports value equality', () {
        expect(
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSavedEvent(tItem),
          equals({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSavedEvent(tItem)),
        );
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}ISE props are correct', () {
        expect(
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSavedEvent(tItem).props,
          equals(<Object?>[tItem]),
        );
      });
    });

    group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDeletedEvent', () {
      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IDE supports value equality', () {
        expect(
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDeletedEvent(tItem),
          equals({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDeletedEvent(tItem)),
        );
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IDE props are correct', () {
        expect(
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDeletedEvent(tItem).props,
          equals(<Object?>[tItem]),
        );
      });
    });

    group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUndoDeletionRequestedEvent', () {
      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IUDRE supports value equality', () {
        expect(
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUndoDeletionRequestedEvent(),
          equals(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUndoDeletionRequestedEvent()),
        );
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IUDRE props are correct', () {
        expect(
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUndoDeletionRequestedEvent().props,
          equals(<Object?>[]),
        );
      });
    });

    group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}FilterChangedEvent', () {
      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}FCE supports value equality', () {
        expect(
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}FilterChangedEvent({{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.all),
          equals(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}FilterChangedEvent({{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.all)),
        );
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}FCE props are correct', () {
        expect(
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}FilterChangedEvent({{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.all).props,
          equals(<Object?>[{{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.all]),
        );
      });
    });
  });
}