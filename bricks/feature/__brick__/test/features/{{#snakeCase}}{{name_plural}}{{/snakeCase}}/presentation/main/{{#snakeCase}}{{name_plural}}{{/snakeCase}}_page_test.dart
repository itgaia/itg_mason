import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dev_framework_tutorial/src/core/error/failures.dart';
import 'package:dev_framework_tutorial/src/core/usecase/usecase.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_page.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_bloc.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/show/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_show_page.dart';
import 'package:dev_framework_tutorial/src/features/settings/settings_service.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:http/http.dart' as http;
import 'package:dev_framework_tutorial/src/app/constants.dart';
import 'package:dev_framework_tutorial/src/app/injection_container.dart';
import 'package:dev_framework_tutorial/src/common/helper.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/get_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_usecase.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_page.dart';

import '../../../../common/app_test_helper.dart';
import '../../../../common/test_helper.dart';
import '../../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  final tData = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData();
  late Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}State fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}State;
  late Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}Event fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}Event;

  setUpAll(() {
    fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}State = Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}State();
    fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}Event = Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}Event();
    registerFallbackValue(fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}State);
    registerFallbackValue(fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}Event);
    registerFallbackValue(NoParams());
    sl.registerLazySingleton<http.Client>(() => MockHttpClient());
  });

  setUp(() async {
    itgLogVerbose('{{#pascalCase}}{{name_plural}}{{/pascalCase}} Page test - SetUp - Start...');
    await initializeAppForTesting();
    if (sl.isRegistered<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>()) {
      sl.unregister<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>();
    }
    sl.registerLazySingleton<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>(() => MockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase());
    sl<SettingsService>().appMainPage = const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Page();
    when(() => sl<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>()(any()))
      .thenAnswer((_) async => Right(tData));
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}} page tests', () {
    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}P correct route name', () {
      expect({{#pascalCase}}{{name_plural}}{{/pascalCase}}Page.routeName, '/{{#snakeCase}}{{name_plural}}{{/snakeCase}}');
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}P page class', (widgetTester) async {
      await widgetTester.testWidgetPageClass<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page>();
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}P page title', (widgetTester) async {
      await widgetTester.testWidgetPageTitle(appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}});
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}P show floating actions', (widgetTester) async {
      await widgetTester.pumpWidgetUnderTest();

      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-floating-actions')), findsOneWidget);
      expect(find.byKey(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$keyFloatingActionRefresh')), findsOneWidget);
      expect(find.byKey(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$keyFloatingActionAdd')), findsOneWidget);
      expect(find.byKey(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$keyFloatingActionEdit')), findsNothing);
      expect(find.byKey(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$keyFloatingActionDuplicate')), findsNothing);
      expect(find.byKey(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$keyFloatingActionDelete')), findsNothing);
    });

    testWidgets('subscribes to items from usecase on initialization', (widgetTester) async {
      await widgetTester.pumpWidgetUnderTest();
      verify(() => sl<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>().call(any())).called(1);
    });
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}} View tests', () {
    late MockNavigator mockNavigator;
    late {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc;

    setUp(() {
      mockNavigator = MockNavigator();
      when(() => mockNavigator.push(any())).thenAnswer((_) async => null);

      mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc = Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc();
      when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.state).thenReturn(
        {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(
          status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.success,
          items: tData
        )
      );

      // usecase with empty data... is it needed?
    });

    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: mockNavigator,
        child: BlocProvider.value(
          value: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc,
          child: const {{#pascalCase}}{{name_plural}}{{/pascalCase}}View()
        )
      );
    }

    testWidgets('renders AppBar with title text', (widgetTester) async {
      await widgetTester.pumpApp(buildSubject(),);

        expect(find.byType(AppBar), findsOneWidget);
        expect(
          find.descendant(
            of: find.byType(AppBar),
            matching: find.text(appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets('renders error text when status changes to failure', (widgetTester) async {
        whenListen<{{#pascalCase}}{{name_plural}}{{/pascalCase}}State>(
          mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc,
          Stream.fromIterable([
            const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(),
            const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(
              status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.failure,
            ),
          ]),
        );

        await widgetTester.pumpApp(buildSubject(),);
        await widgetTester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(
          find.descendant(
            of: find.byType(SnackBar),
            matching: find.text(textMessageToDisplayError(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}', errorMessage: '')),
          ),
          findsOneWidget
        );
      },
    );

    group('{{#pascalCase}}{{name_singular}}{{/pascalCase}}DeletionConfirmationSnackBar', () {
      setUp(() {
        when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.state)
          .thenReturn({{#pascalCase}}{{name_plural}}{{/pascalCase}}State(lastDeletedItem: tData.first));
        whenListen<{{#pascalCase}}{{name_plural}}{{/pascalCase}}State>(
          mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc,
          Stream.fromIterable([
            const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(),
            {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(
              lastDeletedItem: tData.first,
            ),
          ]),
        );
      });

      testWidgets('snackbar is rendered when lastDeletedItem changes', (widgetTester) async {
        await widgetTester.pumpApp(buildSubject());
        await widgetTester.pumpAndSettle();
        await widgetTester.pumpAndSettle();
        await widgetTester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        final snackBar = widgetTester.widget<SnackBar>(find.byType(SnackBar));

        itgLogVerbose('snackBar.content: ${snackBar.content}');
        expect(
          snackBar.content,
          isA<Text>().having((text) => text.data, 'text', contains(tData.first.title)),
        );
      });

      testWidgets('is rendered when lastDeletedItem changes', (widgetTester) async {
        await widgetTester.pumpApp(buildSubject(),);
        await widgetTester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);

        final snackBar = widgetTester.widget<SnackBar>(find.byType(SnackBar));

        expect(
          snackBar.content,
          isA<Text>().having((text) => text.data, 'text', contains(tData.first.title)),
        );
      });

      testWidgets(
        'adds {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent '
        'to {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc '
        'when onUndo is called',
        (widgetTester) async {
          await widgetTester.pumpApp(
            buildSubject(),
            // todosRepository: todosRepository,
          );
          await widgetTester.pumpAndSettle();

          final snackBarAction = widgetTester.widget<SnackBarAction>(
            find.byType(SnackBarAction),
          );

          snackBarAction.onPressed();

          verify(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.add(
            const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent(),
          )).called(1);
        }, skip: true);
    });

    group('when items is empty', () {
      setUp(() {
        when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.state)
          .thenReturn(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State());
      });

      testWidgets('renders nothing when status is initial or error', (widgetTester) async {
          await widgetTester.pumpApp(buildSubject());

          expect(find.byType(ListView), findsNothing);
          expect(find.byType(CupertinoActivityIndicator), findsNothing);
        },
      );

      testWidgets('renders loading indicator when status is loading', (widgetTester) async {
          when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.state).thenReturn(
            const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.loading),
          );

          await widgetTester.pumpApp(buildSubject());

          expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
        },
      );

      testWidgets('renders items empty text when status is success', (widgetTester) async {
          when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.state).thenReturn(
            const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.success),
          );

          await widgetTester.pumpApp(buildSubject());

          expect(find.text(appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}), findsOneWidget);
        },
      );
    });
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}} Page list tests', () {
    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}P renders list widget', (widgetTester) async {
      widgetTester.testRenderWidget<{{#pascalCase}}{{name_plural}}{{/pascalCase}}View>(keyItemsListWidget);
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}P render empty list', (widgetTester) async {
      arrangeReturnsN{{#pascalCase}}{{name_plural}}{{/pascalCase}}AfterNSecondsWait(sl<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>(), count: 0);
      await widgetTester.pumpWidgetUnderTest();

      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}View), findsOneWidget);
      expect(find.byKey(keyTextError), findsNothing);
      expect(find.text(textMessageToDisplayNoData(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}')), findsNothing);
      expect(find.byType(CupertinoActivityIndicator), findsNothing);
      await widgetTester.pump();
      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      expect(find.text(textMessageToDisplayNoData(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}')), findsNothing);
      await widgetTester.pumpAndSettle();
      expect(find.byType(CupertinoActivityIndicator), findsNothing);
      expect(find.text(textMessageToDisplayNoData(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}')), findsOneWidget);
      expect(find.byKey(keyListWidgetItemsData), findsNothing);
      await widgetTester.pump();
      sl.unregister<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>();
      await widgetTester.pump();
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}P render list', (widgetTester) async {
      arrangeReturnsN{{#pascalCase}}{{name_plural}}{{/pascalCase}}AfterNSecondsWait(sl<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>());
      await widgetTester.pumpWidgetUnderTest();

      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}View), findsOneWidget);
      expect(find.byKey(keyTextError), findsNothing);
      expect(find.text(textMessageToDisplayNoData(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}')), findsNothing);
      await widgetTester.pump();
      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      await widgetTester.pump(const Duration(seconds: 2));
      expect(find.text(textMessageToDisplayNoData(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}')), findsNothing);
      expect(find.byKey(keyItemsListWidget), findsOneWidget);
      await widgetTester.pump();
      sl.unregister<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>();
      await widgetTester.pump();
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}P render error', (widgetTester) async {
      // arrange{{#pascalCase}}{{name_plural}}{{/pascalCase}}UsecaseReturnException(sl<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>());
      when(() => sl<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>()(any()))
          .thenAnswer((_) async => const Left(ServerFailure(code: '111')));
      await widgetTester.pumpWidgetUnderTest();

      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}View), findsOneWidget);
      expect(find.byKey(keyTextError), findsNothing);
      expect(find.text(textMessageToDisplayNoData(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}')), findsNothing);
      await widgetTester.pump();
      expect(find.text(textMessageToDisplayNoData(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}')), findsNothing);
      expect(find.byKey(keyListWidgetItemsData), findsNothing);
      expect(find.byKey(keyTextError), findsOneWidget);
      expect(find.text(
          // textMessageToDisplayError(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}', errorMessage: const ServerFailure(description: 'Exception: $textSampleException').toString())),
          textMessageToDisplayError(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}', errorMessage: '')),
          findsOneWidget
      );
      await widgetTester.pump();
      sl.unregister<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>();
      await widgetTester.pump();
    });
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}} Page actions', (){
    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}P - action - add', (widgetTester) async {
      await widgetTester.pumpWidgetUnderTest();

      await widgetTester.tapOnWidget(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$keyFloatingActionAdd'));
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage), findsOneWidget);
      expect(find.text(textSampleContent), findsNothing);
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}P - action - refresh', (widgetTester) async {
      await widgetTester.pumpWidgetUnderTest();
      await widgetTester.pumpAndSettle();

      itgLogVerbose('{{#upperCase}}{{abbreviation}}{{/upperCase}}P - action - refresh - before press refresh');
      await widgetTester.tapOnWidget(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-$keyFloatingActionRefresh'));
      await widgetTester.pumpAndSettle();
      await widgetTester.pumpAndSettle();
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}Page), findsOneWidget);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage), findsNothing);
      expect(find.text(textSampleContent), findsNothing);

      verify(() => sl<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>().call(any())).called(2);
    }, skip: false);
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}} List Item actions', (){
    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}LI - action - show', (widgetTester) async {
      await widgetTester.pumpWidgetUnderTest();
      await widgetTester.pumpAndSettle();

      await widgetTester.tapOnWidget(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-1-$keyActionShow'));
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage), findsOneWidget);
      expect(find.text(textSampleContent), findsNothing);
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}LI - action - edit', (widgetTester) async {
      await widgetTester.pumpWidgetUnderTest();
      await widgetTester.pumpAndSettle();

      await widgetTester.tapOnWidget(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-1-action-edit'));
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage), findsOneWidget);
      expect(find.text(textSampleContent), findsNothing);
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}LI - action - duplicate', (widgetTester) async {
      await widgetTester.pumpWidgetUnderTest();
      await widgetTester.pumpAndSettle();

      await widgetTester.tapOnWidget(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-1-action-duplicate'));
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage), findsOneWidget);
      expect(find.text(textSampleContent), findsNothing);
      expect(find.byKey(keyTextPageTitle), findsOneWidget);
      expect(find.text(appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDuplicatePage), findsOneWidget);
      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-description')), findsOneWidget);
      widgetTester.testClassAndContentForTextFormField(key: const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-description'), text: textTitleSuffixDuplicate);
    });

    testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}LI - action - delete', (widgetTester) async {
      arrange{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDeleteUsecaseReturnSuccess();

      await widgetTester.pumpWidgetUnderTest();
      await widgetTester.pumpAndSettle();

      await widgetTester.tapOnWidget(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-1-action-delete'));
      await widgetTester.tapOnWidgetByText('OK');

      expect(find.byKey(keyNotificationSuccess), findsOneWidget);
      expect(find.text('{{#pascalCase}}{{name_singular}}{{/pascalCase}} has been deleted'), findsOneWidget);
      expect(find.byKey(keyNotificationFailure), findsNothing);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage), findsNothing);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}Page), findsOneWidget);
    });
  });
}