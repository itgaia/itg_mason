import 'package:bloc_test/bloc_test.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/constants.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/injection_container.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/common/helper.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_view.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_page.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/settings/settings_service.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../../../common/app_test_helper.dart';
import '../../../../common/test_helper.dart';
import '../../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model tItem = {{#camelCase}}{{name_plural}}{{/camelCase}}TestData().first;
  late MockNavigator mockNavigator;
  late {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc;

  setUpAll(() {
    registerFallbackValue(Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState());
    registerFallbackValue(Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent());
  });

  setUp(() async {
    itgLogVerbose('{{#pascalCase}}{{name_plural}}{{/pascalCase}} Item Add/Edit Page test - SetUp - Start...');
    mockNavigator = MockNavigator();
    when(() => mockNavigator.push(any())).thenAnswer((_) async => null);

    mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc = Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc();
    when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc.state).thenReturn(
      sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(initialData: tItem)
    );

    await initializeAppForTesting();
    sl<SettingsService>().appMainPage = MockNavigatorProvider(
      navigator: mockNavigator,
      child: BlocProvider.value(
        value: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc,   // TODO: why is this not working?
        // value: sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc>(),
        child: const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage(action: ItemAddEditAction.add),
      ),
    );

  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}} Item Add/Edit page tests', () {
    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEP correct route name', () {
      expect({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage.routeName, '/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit');
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEP page class', (widgetTester) async {
      await widgetTester.testWidgetPageClass<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage>();
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView), findsOneWidget);
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEP page title', (widgetTester) async {
      await widgetTester.testWidgetPageTitle(appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddPage);
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEP do not show floating actions', (widgetTester) async {
      await widgetTester.pumpWidgetUnderTest();

      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-floating-actions')), findsNothing);
      expect(find.byKey(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-$keyFloatingActionRefresh')), findsNothing);
      expect(find.byKey(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-$keyFloatingActionAdd')), findsNothing);
      expect(find.byKey(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-$keyFloatingActionEdit')), findsNothing);
      expect(find.byKey(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-$keyFloatingActionDuplicate')), findsNothing);
      expect(find.byKey(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-$keyFloatingActionDelete')), findsNothing);

      // TODO: How can I test for the correct tooltip?
      // expect(find.text('Refresh {{#pascalCase}}{{name_plural}}{{/pascalCase}}...'), findsOneWidget);
      // expect(find.text('Refresh {{#pascalCase}}{{name_plural}}{{/pascalCase}}'), findsOneWidget);
    });
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage', () {
    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: mockNavigator,
        child: BlocProvider.value(
          value: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc,
          child: const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage(action: ItemAddEditAction.add),
        ),
      );
    }

    group('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEP route', () {
      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEP renders page', (tester) async {
        await tester.pumpRoute({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage.route(action: ItemAddEditAction.add));
        expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage), findsOneWidget);
      });

      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEP supports providing initial data', (tester) async {
        await tester.pumpRoute(
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage.route(
            action: ItemAddEditAction.add,
            initialData: sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemInitialData
          ),
        );
        expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage), findsOneWidget);
        expect(
          find.byWidgetPredicate((w) => w is EditableText && w.controller.text == sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemInitialData.{{test_field_1}}),
          findsOneWidget,
        );
      });
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEP renders view', (tester) async {
      await tester.pumpApp(buildSubject());

      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView), findsOneWidget);
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEP pops when saved successfully', (tester) async {
      whenListen<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState>(
        mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc,
        Stream.fromIterable(const [
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(),
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
            status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.success,
          ),
        ]),
      );
      await tester.pumpApp(buildSubject());

      verify(() => mockNavigator.pop(any<dynamic>())).called(1);
    });
  });

  group('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEP - edit item', () {
    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: mockNavigator,
        child: BlocProvider.value(
          value: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc,
          child: const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage(action: ItemAddEditAction.edit),
        ),
      );
    }

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEP edit pops when saved', (tester) async {
      whenListen<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState>(
        mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc,
        Stream.fromIterable(const [
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(),
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
            status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.success,
          ),
        ]),
      );
      await tester.pumpApp(buildSubject());

      verify(() => mockNavigator.pop(any<dynamic>())).called(1);
    });

    //TODO: How can I correctly test the fiekds edit?
    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEP edit fields', (widgetTester) async {
      // when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc.add({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent(tItem.{{test_field_1}})))
      //   .thenReturn({});
      // await widgetTester.pumpApp(buildSubject());
      //
      // expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage), findsOneWidget);
      // expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView), findsOneWidget);
      //
      // expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_1}}')), findsOneWidget);
      // await widgetTester.enterText(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_1}}')), tItem.{{test_field_1}});
      // await widgetTester.pumpAndSettle();
      //
      // verify(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc.add({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent(tItem.{{test_field_1}}))).called(1);
    }, skip: true);
  });
}