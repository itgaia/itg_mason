import 'package:bloc_test/bloc_test.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/constants.dart';
import 'package:http/http.dart' as http;

import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/injection_container.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/common/helper.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/get_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_usecase.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_bloc.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_page.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/settings/settings_service.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common/test_helper.dart';
import '../../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  // late {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc bloc;
  late Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc;
  late MockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase;

  setUpAll(() async {
    itgLogVerbose('setUpAll - start....');
    registerFallbackValue(Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}State());
    registerFallbackValue(Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}Event());
    sl.registerLazySingleton<http.Client>(() => MockHttpClient());
    await initializeAppForTesting();
    // appMainPage = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Page(title: ItgLocalization.tr('{{#pascalCase}}{{name_plural}}{{/pascalCase}}'));
    sl<SettingsService>().appMainPage = const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Page();
    setUpHttpClientGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Success200();
  });

  setUp(() async {
    itgLogVerbose('setUp - start....');
    mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase = MockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase();
    mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc = Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc();
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}List', () {
    testWidgets('page class', (widgetTester) async {
      // await widgetTester.testWidgetPageClass<{{#pascalCase}}{{name_plural}}{{/pascalCase}}List>();
      await widgetTester.testWidgetPageClass<{{#pascalCase}}{{name_plural}}{{/pascalCase}}View>();
    });

    testWidgets('renders CircularProgressIndicator when state is loading', (WidgetTester widgetTester) async {
      // when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.state).thenReturn(Loading());
      when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.state).thenReturn(
        const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(
          status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.loading,
          items: []
        )
      );
      await widgetTester.pump{{#pascalCase}}{{name_plural}}{{/pascalCase}}List(mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc);
      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      expect(find.byKey(keyProgressIndicatorMain), findsOneWidget);
    });

    testWidgets('loading indicator is displayed while wait for data', (widgetTester) async {
      if (sl.isRegistered<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>()) {
        sl.unregister<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>();
      }
      sl.registerLazySingleton<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>(() => mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase);
      arrangeReturnsN{{#pascalCase}}{{name_plural}}{{/pascalCase}}AfterNSecondsWait(mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase);

      await widgetTester.pumpWidgetUnderTest();
      await widgetTester.pump(const Duration(milliseconds: 500));
      expect(find.byKey(keyTextError), findsNothing);
      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      expect(find.byKey(keyProgressIndicatorMain), findsOneWidget);
      await widgetTester.pump(const Duration(milliseconds: 1500));
    });

    testWidgets('renders no data message when success with empty list', (widgetTester) async {
      // when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.state).thenReturn(Empty());
      when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.state).thenReturn(
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(
              status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.success,
              items: []
          )
      );
      await widgetTester.pump{{#pascalCase}}{{name_plural}}{{/pascalCase}}List(mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc);
      expect(find.byKey(keyTextError), findsNothing);
      expect(find.text(textMessageToDisplayNoData(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}')), findsOneWidget);
    });

    testWidgets('renders (show) N items', (widgetTester) async {
      // the items (maybe) are more but it shows only N...
      // when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.state)
      //     .thenReturn(Loaded({{#camelCase}}{{name_plural}}{{/camelCase}}: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}));
      when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.state).thenReturn(
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(
              status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.success,
              items: {{#camelCase}}{{name_plural}}{{/camelCase}}TestData()
          )
      );
      await widgetTester.pump{{#pascalCase}}{{name_plural}}{{/pascalCase}}List(mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ListItem), findsNWidgets({{show_items_in_screen}}));
    });
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}} list tests', () {
    testWidgets('render empty list', (widgetTester) async {
      // widgetTester.testRenderListEmpty(mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc, [Loading(), const Loaded({{#camelCase}}{{name_plural}}{{/camelCase}}: []), Empty()], Empty(), {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent());

      itgLogVerbose('before whenListen...');
      whenListen(
        mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc,
        Stream.fromIterable([
          // const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(),
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.initial),
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.failure),
        ])
      );
      itgLogVerbose('after whenListen...');

      await widgetTester.pump{{#pascalCase}}{{name_plural}}{{/pascalCase}}List(mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc..add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent()));
      itgLogVerbose('after pump{{#pascalCase}}{{name_plural}}{{/pascalCase}}List...');
      await widgetTester.pumpAndSettle();
      // await widgetTester.pumpAndSettle();
      // await widgetTester.pumpAndSettle();
      // await widgetTester.pump(const Duration(seconds: 1));
      // await widgetTester.pump(const Duration(seconds: 1));
      // await widgetTester.pump(const Duration(seconds: 1));

      // expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}List), findsOneWidget);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}View), findsOneWidget);
      itgLogVerbose('111...');
      expect(find.byKey(keyTextError), findsNothing);
      itgLogVerbose('222...');
      // expect(find.text(textMessageToDisplayNoData(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}')), findsOneWidget);
      itgLogVerbose('333...');
      await widgetTester.pump(const Duration(seconds: 1));
      itgLogVerbose('444...');
      expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
      itgLogVerbose('555...');
      await widgetTester.pump(const Duration(seconds: 1));
      itgLogVerbose('666...');
      expect(find.text(textMessageToDisplayNoData(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}')), findsNothing);
      itgLogVerbose('777...');
      expect(find.byKey(keyListWidgetItemsData), findsOneWidget);
      itgLogVerbose('888...');
      await widgetTester.pump(const Duration(seconds: 1));
      itgLogVerbose('999...');
      expect(find.text(textMessageToDisplayNoData(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}')), findsOneWidget);
      itgLogVerbose('AAA...');
      expect(find.byKey(keyListWidgetItemsData), findsNothing);
      itgLogVerbose('BBB...');
    }, skip: true);
  });
}
