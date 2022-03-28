import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dev_framework_tutorial/src/app/injection_container.dart';
import 'package:dev_framework_tutorial/src/common/helper.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/show/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_screen.dart';
import 'package:dev_framework_tutorial/src/features/settings/settings_service.dart';

import '../../../../common/test_helper.dart';
import '../../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  setUp(() async {
    itgLogVerbose('{{#pascalCase}}{{name_plural}}{{/pascalCase}} Item Page test - SetUp - Start...');
    await initializeAppForTesting();
    sl<SettingsService>().appMainPage = {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemScreen(data: {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData().first);
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemScreen', () {
    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IS page class', (widgetTester) async {
      await widgetTester.testWidgetPageClass<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemScreen>();
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IS render {{#pascalCase}}{{name_singular}}{{/pascalCase}} fields', (WidgetTester widgetTester) async {
      // List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> data = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData();
      await widgetTester.pumpWidgetUnderTest();
      await widgetTester.pumpAndSettle();

      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-col1-id')), findsOneWidget);
      {{#fields}}expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-col1-{{#paramCase}}{{field_name}}{{/paramCase}}')), findsOneWidget);{{^is_last}}
      {{/is_last}}{{/fields}}
    });
  });
}