import 'package:dev_framework_tutorial/src/common/helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_bloc.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_list_filter.dart';

void main() {
  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}State', () {
    const mockItem = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
      id: '1',
      description: 'description 1',
      content: 'content 1',
      updatedAt: '2021-09-22T07:06:52.604Z'
    );
    const mockItems = [mockItem];

    {{#pascalCase}}{{name_plural}}{{/pascalCase}}State createSubject({
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status status = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.initial,
      List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>? items,
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter filter = {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.all,
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model? lastDeletedItem,
    }) {
      return {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(
        status: status,
        items: items ?? mockItems,
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
          items: mockItems,
          filter: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.all,
          lastDeletedItem: null,
        ).props,
        equals(<Object?>[
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.initial, // status
          mockItems, // todos
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.all, // filter
          null, // lastDeletedTodo
        ]),
      );
    });

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}S filteredItems returns items filtered by filter', () {
      expect(
        createSubject(
          items: mockItems,
          filter: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.latest,
        ).filteredItems,
        // equals(mockItems.where((item) => item.dtEmpty.isNotEmpty).toList()),
        equals(mockItems.where((item) {
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
            lastDeletedItem: () => mockItem,
          ),
          equals(
            createSubject(
              status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.success,
              items: [],
              filter: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.latest,
              lastDeletedItem: mockItem,
            ),
          ),
        );
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}S can copyWith null lastDeletedItem', () {
        expect(
          createSubject(lastDeletedItem: mockItem).copyWith(
            lastDeletedItem: () => null,
          ),
          equals(createSubject(lastDeletedItem: null)),
        );
      });
    });
  });
}
