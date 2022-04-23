import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/common/etc/itg_text.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/common/helper.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/constants.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/home/home_page.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_page.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_view.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_page.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/show/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_show_page.dart';

import '../test/common/test_helper.dart';

const useDelays = false;
const msgBaseSourceClass = 'app_test';
String msgBaseSourceMethod = '';
void msgLogInfo(String msg) => itgLogVerbose('[$msgBaseSourceClass/$msgBaseSourceMethod] $msg');
void msgLogPrint(String msg) => itgLogPrint('[$msgBaseSourceClass/$msgBaseSourceMethod] $msg');

const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model data{{#pascalCase}}{{name_plural}}{{/pascalCase}}1 = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
  {{test_field_1}}: 'My New {{#pascalCase}}{{name_singular}}{{/pascalCase}}',
  {{test_field_2}}: 'This is the {{test_field_2}} for my new {{#snakeCase}}{{name_singular}}{{/snakeCase}}...',
);
const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model data{{#pascalCase}}{{name_plural}}{{/pascalCase}}2 = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
  {{test_field_1}}: 'My Edited New {{#pascalCase}}{{name_singular}}{{/pascalCase}}',
  {{test_field_2}}: 'This is the edited {{test_field_2}} for my new {{#snakeCase}}{{name_singular}}{{/snakeCase}}...',
);
const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model data{{#pascalCase}}{{name_plural}}{{/pascalCase}}3 = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
  {{test_field_1}}: 'My Double Edited New {{#pascalCase}}{{name_singular}}{{/pascalCase}}',
  {{test_field_2}}: 'This is the double edited {{test_field_2}} for my new {{#snakeCase}}{{name_singular}}{{/snakeCase}}...',
);
const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model data{{#pascalCase}}{{name_plural}}{{/pascalCase}}4 = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
  {{test_field_1}}: 'Another {{#pascalCase}}{{name_singular}}{{/pascalCase}}',
  {{test_field_2}}: 'This is the {{test_field_2}} for another {{#snakeCase}}{{name_singular}}{{/snakeCase}}...',
);

// TODO: Refactor - The tests here are depended - The next needs the previous to have run successfully...
// TODO: Refactor - If the new data is outside of the visible area it must bu scrolled down in order for the tests to work...
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const sample{{#pascalCase}}{{test_field_1}}{{/pascalCase}} = 'new {{test_field_1}}';

  group('end-to-end test', () {
    setUp(() async {
      await initializeAppForTesting();
      // bootstrapForTesting(() => const App());
    });

    testWidgets('add a new {{#snakeCase}}{{name_singular}}{{/snakeCase}}', (WidgetTester widgetTester) async {
      msgBaseSourceMethod = 'add a new {{#snakeCase}}{{name_singular}}{{/snakeCase}}';
      msgLogInfo('start........\n');

      // await widgetTester.pumpWidget(const App());
      // bootstrapForTesting(() => const App(), widgetTester: widgetTester);
      // await widgetTester.pumpAndSettle();
      await widgetTester.pumpWidgetUnderTest();

      // bootstrapForTesting(() => const App());

      await widgetTester.testNavigateToPage<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page>(keyButton{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page);

      // await scrollToTheEndOfList(widgetTester);
      expect(find.text(sample{{#pascalCase}}{{test_field_1}}{{/pascalCase}}), findsNothing);

      msgLogInfo('add a new item...');
      await widgetTester.testNavigateToPage<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage>(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$keyFloatingActionAdd'));
      await widgetTester.enterText(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_1}}')), data{{#pascalCase}}{{name_plural}}{{/pascalCase}}1.{{test_field_1}});
      await widgetTester.enterText(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_2}}')), data{{#pascalCase}}{{name_plural}}{{/pascalCase}}1.{{test_field_2}});
      await widgetTester.testNavigateToPage<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page>(keyButtonSaveItemAddEditPage);
      msgLogInfo('saved the new item...');

      // await widgetTester.pageBack();
      await widgetTester.pumpAndSettle();
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage), findsNothing);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage), findsNothing);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView), findsNothing);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}Page), findsOneWidget);

      // await scrollToTheEndOfList(widgetTester);

      expect(find.text(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}1.{{test_field_1}}), findsOneWidget);

      msgLogInfo('end........\n');
    }, skip: false);

    testWidgets('add another {{#snakeCase}}{{name_singular}}{{/snakeCase}}', (WidgetTester widgetTester) async {
      msgBaseSourceMethod = 'add another {{#snakeCase}}{{name_singular}}{{/snakeCase}}';
      msgLogInfo('start........\n');

      await widgetTester.pumpWidgetUnderTest();

      await widgetTester.testNavigateToPage<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page>(keyButton{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page);

      msgLogInfo('add another item...');
      await widgetTester.testNavigateToPage<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage>(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$keyFloatingActionAdd'));
      await widgetTester.enterText(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_1}}')), data{{#pascalCase}}{{name_plural}}{{/pascalCase}}4.{{test_field_1}});
      await widgetTester.enterText(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_2}}')), data{{#pascalCase}}{{name_plural}}{{/pascalCase}}4.{{test_field_2}});
      await widgetTester.testNavigateToPage<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page>(keyButtonSaveItemAddEditPage);
      msgLogInfo('saved the another item...');

      await widgetTester.pumpAndSettle();
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage), findsNothing);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage), findsNothing);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView), findsNothing);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}Page), findsOneWidget);

      expect(find.text(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}4.{{test_field_1}}), findsOneWidget);

      msgLogInfo('end........\n');
    }, skip: false);

    testWidgets('show and edit the new {{#snakeCase}}{{name_singular}}{{/snakeCase}}', (WidgetTester widgetTester) async {
      msgBaseSourceMethod = 'show and edit the new {{#snakeCase}}{{name_singular}}{{/snakeCase}}';
      msgLogInfo('start........\n');

      await widgetTester.pumpWidgetUnderTest();
      // bootstrapForTesting(() => const App());
      // bootstrapForTesting(() => await widgetTester.pumpWidget(const App()));
      // widgetTester.bootstrapForTesting(() => const App(), widgetTester: widgetTester);

      await widgetTester.testNavigateToPage<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page>(keyButton{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page);
      msgLogInfo('------>>> items list page........\n');
      expect(find.byKey(keyTextError), findsNothing);

      msgLogInfo('------>>> before enter item show page........\n');
      await widgetTester.testNavigateToPageByText<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage>(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}1.{{test_field_1}}, scrollToTheEnd: true);

      msgLogInfo('------>>> item show page........\n');
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage), findsOneWidget);
      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-col1-id')), findsOneWidget);
      final itemId = widgetTester.widget<ItgTextWithLabel>(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-col1-id'))).text;
      // final itemId = widgetTester.widget<Text>(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-col1-id'))).data;
      msgLogInfo('>>>>>>> itemId: $itemId');

      msgLogInfo('------>>> before enter item edit page........\n');
      await widgetTester.testNavigateToPage<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage>(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-$keyFloatingActionEdit'));
      msgLogInfo('------>>> item edit page........\n');
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage), findsOneWidget);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView), findsOneWidget);
      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_1}}')), findsOneWidget);
      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_2}}')), findsOneWidget);

      msgLogInfo('------>>> before enter field values in edit page........\n  data.{{test_field_1}}: ${data{{#pascalCase}}{{name_plural}}{{/pascalCase}}2.{{test_field_1}}}\n');
      await widgetTester.tapOnWidget(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_1}}'));
      await widgetTester.enterText(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_1}}')), data{{#pascalCase}}{{name_plural}}{{/pascalCase}}2.{{test_field_1}});

      await widgetTester.scrollToTheEndOfList(key: keyItemAddEditViewWidget);
      await widgetTester.tapOnWidget(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_2}}'));
      await widgetTester.enterText(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_2}}')), data{{#pascalCase}}{{name_plural}}{{/pascalCase}}2.{{test_field_2}});

      msgLogInfo('------>>> before save item in edit page........\n');
      if (useDelays) await Future.delayed(const Duration(seconds: 2));
      await widgetTester.tapOnWidget(keyButtonSaveItemAddEditPage);

      msgLogInfo('------>>> item show page (returned)........\n');
      if (useDelays) await Future.delayed(const Duration(seconds: 2));
      expect(find.byKey(keyNotificationFailure), findsNothing);
      expect(find.byKey(keyNotificationSuccess), findsOneWidget);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage), findsOneWidget);
      expect(find.text(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}1.{{test_field_1}}), findsNothing);
      expect(find.text(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}1.{{test_field_2}}), findsNothing);
      await widgetTester.testWidgetText(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}2.{{test_field_1}}, const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-col1-{{test_field_1}}'));
      await widgetTester.testWidgetText(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}2.{{test_field_2}}, const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-col1-{{test_field_2}}'));

      if (useDelays) await Future.delayed(const Duration(seconds: 2));
      msgLogInfo('------>>> before return back to items list page........\n');
      await widgetTester.tap(find.byTooltip('Close'));
      await widgetTester.pumpAndSettle();
      msgLogInfo('------>>> items list page (returned)........\n');
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage), findsNothing);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}Page), findsOneWidget);
      // await scrollToTheEndOfList(widgetTester);
      // msgLogInfo('------>>> items list page - scrolled to the end........\n');

      if (useDelays) await Future.delayed(const Duration(seconds: 2));
      expect(find.text(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}1.{{test_field_1}}), findsNothing);
      expect(find.text(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}1.{{test_field_2}}), findsNothing);
      await widgetTester.testWidgetText(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}2.{{test_field_1}}, Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$itemId-title'));
      await widgetTester.testWidgetText(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}2.{{test_field_2}}, Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$itemId-{{test_field_2}}'));

      msgLogInfo('------>>> before enter item edit page (2nd time)........\n');
      await widgetTester.testNavigateToPage<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage>(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$itemId-action-edit'), scrollToTheEnd: true);
      msgLogInfo('------>>> item edit page........\n');
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage), findsOneWidget);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView), findsOneWidget);
      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_1}}')), findsOneWidget);
      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_2}}')), findsOneWidget);

      msgLogInfo('------>>> before enter field values in edit page (2nd time)........\n  data.{{test_field_1}}: ${data{{#pascalCase}}{{name_plural}}{{/pascalCase}}3.{{test_field_1}}}\n');
      await widgetTester.tapOnWidget(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_1}}'));
      await widgetTester.enterText(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_1}}')), data{{#pascalCase}}{{name_plural}}{{/pascalCase}}3.{{test_field_1}});

      await widgetTester.scrollToTheEndOfList(key: keyItemAddEditViewWidget);
      await widgetTester.tapOnWidget(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_2}}'));
      await widgetTester.enterText(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_2}}')), data{{#pascalCase}}{{name_plural}}{{/pascalCase}}3.{{test_field_2}});

      msgLogInfo('------>>> before save item in edit page (2nd time)........\n');
      if (useDelays) await Future.delayed(const Duration(seconds: 2));
      await widgetTester.tapOnWidget(keyButtonSaveItemAddEditPage);

      msgLogInfo('------>>> items list page (returned 2nd time)........\n');
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage), findsNothing);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}Page), findsOneWidget);
      // await scrollToTheEndOfList(widgetTester);
      // msgLogInfo('------>>> items list page - scrolled to the end........\n');

      if (useDelays) await Future.delayed(const Duration(seconds: 2));
      expect(find.text(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}1.{{test_field_1}}), findsNothing);
      expect(find.text(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}1.{{test_field_2}}), findsNothing);
      expect(find.text(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}2.{{test_field_1}}), findsNothing);
      expect(find.text(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}2.{{test_field_2}}), findsNothing);
      await widgetTester.testWidgetText(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}3.{{test_field_1}}, Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$itemId-title'));
      await widgetTester.testWidgetText(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}3.{{test_field_2}}, Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$itemId-{{test_field_2}}'));

      msgLogInfo('end........\n');
    }, skip: false);

    testWidgets('show and delete the new {{#snakeCase}}{{name_singular}}{{/snakeCase}}', (WidgetTester widgetTester) async {
      msgBaseSourceMethod = 'show and delete the new {{#snakeCase}}{{name_singular}}{{/snakeCase}}';
      msgLogInfo('start........\n');

      await widgetTester.pumpWidgetUnderTest();

      await widgetTester.testNavigateToPage<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page>(keyButton{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page);
      await widgetTester.pumpAndSettle();
      expect(find.byKey(keyTextError), findsNothing);
      // await scrollToTheEndOfList(widgetTester);

      await widgetTester.testNavigateToPageByText<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage>(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}3.{{test_field_1}}, scrollToTheEnd: true);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage), findsOneWidget);
      await widgetTester.tapOnWidget(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-$keyFloatingActionDelete'));
      await widgetTester.tapOnWidgetByText('OK', waitToSettle: true);
      if (useDelays) await Future.delayed(const Duration(seconds: 2));

      expect(find.byKey(keyNotificationSuccess), findsOneWidget);
      expect(find.byKey(keyNotificationFailure), findsNothing);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage), findsNothing);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}Page), findsOneWidget);
      if (useDelays) await Future.delayed(const Duration(seconds: 2));

      // await scrollToTheEndOfList(widgetTester);
      expect(find.text(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}3.{{test_field_1}}), findsNothing);
      expect(find.text(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}3.{{test_field_2}}), findsNothing);
      if (useDelays) await Future.delayed(const Duration(seconds: 2));

      msgLogInfo('end........\n');
    }, skip: false);

    testWidgets('delete the another {{#snakeCase}}{{name_singular}}{{/snakeCase}}', (WidgetTester widgetTester) async {
      msgBaseSourceMethod = 'delete the another {{#snakeCase}}{{name_singular}}{{/snakeCase}}';
      msgLogInfo('start........\n');

      await widgetTester.pumpWidgetUnderTest();

      await widgetTester.testNavigateToPage<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page>(keyButton{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page);
      await widgetTester.pumpAndSettle();
      expect(find.byKey(keyTextError), findsNothing);
      // await scrollToTheEndOfList(widgetTester);

      msgLogInfo('------>>> before enter item show page........\n');
      await widgetTester.testNavigateToPageByText<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage>(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}4.{{test_field_1}}, scrollToTheEnd: true);

      msgLogInfo('------>>> item show page........\n');
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage), findsOneWidget);
      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-col1-id')), findsOneWidget);
      final itemId = widgetTester.widget<ItgTextWithLabel>(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-col1-id'))).text;
      // final itemId = widgetTester.widget<Text>(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-col1-id'))).data;
      msgLogInfo('>>>>>>> itemId: $itemId');

      await widgetTester.tap(find.byTooltip('Close'));
      await widgetTester.pumpAndSettle();
      msgLogInfo('------>>> items list page (returned from another)........\n');
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage), findsNothing);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}Page), findsOneWidget);

      msgLogInfo('before check for texts...\n');
      await widgetTester.testWidgetText(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}4.{{test_field_1}}, Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$itemId-title'));
      await widgetTester.testWidgetText(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}4.{{test_field_2}}, Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$itemId-{{test_field_2}}'));

      msgLogInfo('before press delete...\n');
      await widgetTester.tapOnWidget(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$itemId-action-delete'));
      await widgetTester.tapOnWidgetByText('OK', waitToSettle: true);
      if (useDelays) await Future.delayed(const Duration(seconds: 2));

      msgLogInfo('after delete...\n');
      expect(find.byKey(keyNotificationSuccess), findsOneWidget);
      expect(find.byKey(keyNotificationFailure), findsNothing);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage), findsNothing);
      expect(find.byType(HomePage), findsNothing);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}Page), findsOneWidget);

      // await scrollToTheEndOfList(widgetTester);
      expect(find.text(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}4.{{test_field_1}}), findsNothing);
      expect(find.text(data{{#pascalCase}}{{name_plural}}{{/pascalCase}}4.{{test_field_2}}), findsNothing);
      if (useDelays) await Future.delayed(const Duration(seconds: 2));

      msgLogInfo('end........\n');
    }, skip: false);
  });
}
