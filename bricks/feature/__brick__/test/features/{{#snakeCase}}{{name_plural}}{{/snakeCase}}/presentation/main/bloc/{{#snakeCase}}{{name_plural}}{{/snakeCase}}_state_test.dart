import 'package:dev_framework_tutorial/src/common/helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_bloc.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_list_filter.dart';

import '../../../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}State', () {
    {{#pascalCase}}{{name_plural}}{{/pascalCase}}State createSubject({
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status status = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.initial,
      List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>? items,
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter filter = {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.all,
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model? lastDeletedItem,
    }) {
      return {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(
        status: status,
        items: items ?? mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Items,
        filter: filter,
        lastDeletedItem: lastDeletedItem,
      );
    }

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}S supports value equality', () {
      expect(createSubject(), equals(createSubject()));
    });

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}S props are correct', () {
      expect(
        createSubject(
          status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.initial,
          items: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Items,
          filter: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.all,
          lastDeletedItem: null,
        ).props,
        equals(<Object?>[
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.initial, // status
          mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Items, // todos
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.all, // filter
          null, // lastDeletedTodo
        ]),
      );
    });

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}S filteredItems returns items filtered by filter', () {
      expect(
        createSubject(
          items: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Items,
          filter: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.latest,
        ).filteredItems,
        // equals(mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Items.where((item) => item.dtEmpty.isNotEmpty).toList()),
        equals(mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Items.where((item) {
          final DateTime dtUpdatedAt = jsonStringAsValue(item.updatedAt, valueType: 'date');
          final DateTime dtMin = DateTime.now().subtract(const Duration(days: 30+1));
          return dtUpdatedAt.isAfter(dtMin);
        }).toList()),
      );
    });

    group('{{#upperCase}}{{abbreviation}}{{/upperCase}}S copyWith', () {
      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}S copyWith returns the same object if no arguments are provided', () {
        expect(createSubject().copyWith(), equals(createSubject()));
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}S copyWith retains the old value for every parameter if null is provided', () {
        expect(
          createSubject().copyWith(
            status: null,
            items: null,
            filter: null,
            lastDeletedItem: null,
          ),
          equals(createSubject()),
        );
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}S copyWith replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
            status: () => {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.success,
            items: () => [],
            filter: () => {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.latest,
            lastDeletedItem: () => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item,
          ),
          equals(
            createSubject(
              status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.success,
              items: [],
              filter: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.latest,
              lastDeletedItem: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item,
            ),
          ),
        );
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}S can copyWith null lastDeletedItem', () {
        expect(
          createSubject(lastDeletedItem: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item).copyWith(
            lastDeletedItem: () => null,
          ),
          equals(createSubject(lastDeletedItem: null)),
        );
      });
    });
  });
}
