import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dev_framework_tutorial/src/app/constants.dart';
import 'package:dev_framework_tutorial/src/app/injection_container.dart';
import 'package:dev_framework_tutorial/src/common/helper.dart';
import 'package:dev_framework_tutorial/src/common/itg_localization.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_page.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_view.dart';
import 'package:dev_framework_tutorial/src/features/settings/settings_service.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../../../common/app_test_helper.dart';
import '../../../../common/test_helper.dart';
import '../../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {{#snakeCase}}{{name_plural}}{{/snakeCase}}Item = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData().first;
  late MockNavigator mockNavigator;
  late {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc;

  setUpAll(() {
  });

  setUp(() async {
    mockNavigator = MockNavigator();
    when(() => mockNavigator.push(any())).thenAnswer((_) async => null);

    mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc = Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc();
    when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc.state).thenReturn(
        {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
            initialData: {{#snakeCase}}{{name_plural}}{{/snakeCase}}Item,
            description: {{#snakeCase}}{{name_plural}}{{/snakeCase}}Item.description,
            content: {{#snakeCase}}{{name_plural}}{{/snakeCase}}Item.content
        )
    );

    itgLogVerbose('{{#pascalCase}}{{name_plural}}{{/pascalCase}} Item Add/Edit View test - SetUp - Start...');
    await initializeAppForTesting();
    itgLogVerbose('{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_view_test - set appMainPage....');
    sl<SettingsService>().appMainPage = MockNavigatorProvider(
      navigator: mockNavigator,
      child: BlocProvider.value(
        value: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc,
        child: const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView(title: textSampleContent),
      ),
    );
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}} Item Add/Edit view tests', () {
    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEV page class', (widgetTester) async {
      await widgetTester.testWidgetPageClass<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView>();
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEV show view widgets', (widgetTester) async {
      await widgetTester.pumpWidgetUnderTest();
      // await widgetTester.pumpAndSettle();
      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-description')), findsOneWidget);
      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-content')), findsOneWidget);

      expect(find.byType(Form), findsNothing);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-form')), findsNothing);
      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-form-submit')), findsNothing);
    });
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView - title', () {
    testWidgets('renders AppBar with title text for new items when a new item is being created', (tester) async {
      Widget buildSubject() {
        return BlocProvider.value(
          value: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc,
          child: const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage(action: ItemAddEditAction.add),
        );
      }

      when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc.state).thenReturn(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState());
      await tester.pumpApp(buildSubject());

      expect(find.byType(AppBar), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text(ItgLocalization.tr(appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddPage)),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders AppBar with title text for editing items when an existing item is being edited', (tester) async {
      Widget buildSubject() {
        return BlocProvider.value(
          value: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc,
          child: const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage(action: ItemAddEditAction.edit),
        );
      }

      when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc.state).thenReturn(
        const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
          initialData: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(description: 'description'),
        ),
      );
      await tester.pumpApp(buildSubject());

      expect(find.byType(AppBar), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text(ItgLocalization.tr(appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemEditPage)),
        ),
        findsOneWidget,
      );
    });
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView - fields', () {
    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: mockNavigator,
        child: BlocProvider.value(
          value: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc,
          child: const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView(title: textSampleContent),
        ),
      );
    }

    group('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEV code text form field', () {
      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEV code is rendered', (tester) async {
        await tester.pumpApp(buildSubject());

        expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-description')), findsOneWidget);
      });

      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEV code is disabled when loading', (tester) async {
        when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc.state).thenReturn(
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.submitting),
        );
        await tester.pumpApp(buildSubject());

        final textField = tester.widget<TextFormField>(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-description')));
        expect(textField.enabled, false);
      });

      testWidgets(
        'adds {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent '
        'to {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc '
        'when a new value is entered',
        (tester) async {
          await tester.pumpApp(buildSubject());
          await tester.enterText(
            find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-description')),
            'new code',
          );

          verify(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc
              .add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent('new code')))
              .called(1);
        },
      );
    });

    group('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEV context text form field', () {
      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEV context is rendered', (tester) async {
        await tester.pumpApp(buildSubject());

        expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-content')), findsOneWidget);
      });

      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEV context is disabled when loading', (tester) async {
        when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc.state).thenReturn(
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.submitting),
        );
        await tester.pumpApp(buildSubject());

        final textField = tester.widget<TextFormField>(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-content')));
        expect(textField.enabled, false);
      });

      testWidgets(
        'adds {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditContentChangedEvent '
        'to {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc '
        'when a new value is entered',
        (tester) async {
          await tester.pumpApp(buildSubject());
          await tester.enterText(
            find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-content')),
            'new-content',
          );

          verify(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc
              .add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditContentChangedEvent('new-content')))
              .called(1);
        },
      );
    });

    group('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEV save fab', () {
      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEV save fab is rendered', (tester) async {
        await tester.pumpApp(buildSubject());

        expect(
          find.descendant(
            of: find.byType(FloatingActionButton),
            matching: find.byTooltip(ItgLocalization.tr('Save changes')),
          ),
          findsOneWidget,
        );
      });

      testWidgets(
        'adds {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent '
        'to {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc '
        'when tapped',
        (tester) async {
          await tester.pumpApp(buildSubject());
          await tester.tap(find.byType(FloatingActionButton));

          verify(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc
              .add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent()))
              .called(1);
        },
      );
    });
  });

  // group('', () {
  //   testWidgets('adds {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent '
  //         'to {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc '
  //         'when tapped',
  //         (tester) async {
  //       await tester.pumpApp(buildSubject());
  //       await tester.tap(find.byType(FloatingActionButton));
  //
  //       verify(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc
  //           .add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent()))
  //           .called(1);
  //     },
  //   );
  // });
}