import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/constants.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/injection_container.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/common/helper.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/common/itg_localization.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_page.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_bloc.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_page.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/show/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_show_page.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/settings/settings_service.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../../../common/test_helper.dart';
import '../../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

const tagFull = '{{#pascalCase}}{{name_plural}}{{/pascalCase}} Item Show Page';
const tagShort = r'NISP';

void main() {
  final List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> tItems = {{#camelCase}}{{name_plural}}{{/camelCase}}TestData();
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model tData = tItems.first;
  late Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc;
  late MockNavigator mockNavigator;

  setUp(() async {
    itgLogVerbose(r'{{#pascalCase}}{{name_plural}}{{/pascalCase}} Item Show Page test - SetUp - Start...');

    mockNavigator = MockNavigator();
    // when(() => mockNavigator.push(any())).thenAnswer((_) async => null);

    mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc = Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc();
    when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.state).thenReturn({{#pascalCase}}{{name_plural}}{{/pascalCase}}State(
      status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.success,
      items: tItems
    ));

    await initializeAppForTesting();
    sl<SettingsService>().appMainPage = BlocProvider<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>.value(
      value: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc,
      child: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage(title: ItgLocalization.tr('{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item'), item: tData),
    );
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}} Item Show Page tests', (){
    test('NISP correct route name', () {
      expect({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage.routeName, '/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item');
    });

    testWidgets('NISP page class', (widgetTester) async {
      await widgetTester.testWidgetPageClass<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage>();
    });

    testWidgets('NISP page title', (widgetTester) async {
      await widgetTester.testWidgetPageTitle(appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item);
    });

    testWidgets('NISP show actions', (widgetTester) async {
      // TODO: check with allowXXXX set to false or true....
      // if (sl.isRegistered<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>()) {
      //   sl.unregister<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>();
      // }
      // sl.registerLazySingleton<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support);
      //
      // when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support(any())).thenReturn({{#pascalCase}}{{name_plural}}{{/pascalCase}}Support());
      // when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support.allowRefresh).thenReturn(true);

      await widgetTester.pumpWidgetUnderTest();
      await widgetTester.pumpAndSettle();

      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-floating-actions')), findsOneWidget);
      expect(find.byKey(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-$keyFloatingActionRefresh')), findsOneWidget);
      expect(find.byKey(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-$keyFloatingActionEdit')), findsOneWidget);
      expect(find.byKey(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-$keyFloatingActionDuplicate')), findsOneWidget);
      expect(find.byKey(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-$keyFloatingActionAdd')), findsOneWidget);
      expect(find.byKey(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-$keyFloatingActionDelete')), findsOneWidget);
    });
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}} Item Show Page actions', (){
    testWidgets('NISP action edit', (widgetTester) async {
      await widgetTester.pumpWidgetUnderTest();
      await widgetTester.pumpAndSettle();

      await widgetTester.tapOnWidget(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-$keyFloatingActionEdit'));
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage), findsOneWidget);
      expect(find.text(textSampleContent), findsNothing);
    });

    testWidgets('NISP action duplicate', (widgetTester) async {
      await widgetTester.pumpWidgetUnderTest();
      await widgetTester.pumpAndSettle();

      await widgetTester.tapOnWidget(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-$keyFloatingActionDuplicate'));
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage), findsOneWidget);
      expect(find.text(textSampleContent), findsNothing);
      expect(find.byKey(keyTextPageTitle), findsOneWidget);
      expect(find.text(appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDuplicatePage), findsOneWidget);
      expect(find.byKey(const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_1}}')), findsOneWidget);
      widgetTester.testClassAndContentForTextFormField(key: const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase-col1-{{test_field_1}}'), text: textTitleSuffixDuplicate);
    });

    group('{{#pascalCase}}{{name_plural}}{{/pascalCase}} Item Show Page action delete', () {
      setUp(() {
        arrange{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDeleteUsecaseReturnSuccess();
      });

      testWidgets('NISP action delete', (widgetTester) async {
        await widgetTester.pumpWidgetUnderTest();
        await widgetTester.pumpAndSettle();

        await widgetTester.tapOnWidget(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-$keyFloatingActionDelete'));
        await widgetTester.tapOnWidgetByText('OK');
        // await widgetTester.pumpAndSettle();

        expect(find.byKey(keyNotificationSuccess), findsOneWidget);
        expect(find.text('{{#titleCase}}{{name_singular}}{{/titleCase}} has been deleted'), findsOneWidget);
        expect(find.byKey(keyNotificationFailure), findsNothing);
        expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage), findsOneWidget);
        expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}Page), findsNothing);
      });

      testWidgets('NISP pops when deleted successfully', (widgetTester) async {
        when(() => mockNavigator.push(any())).thenAnswer((_) async => null);
        // TODO: When I use the MockNavigatorProvider then the process does not
        //       continue after the confirm_dialog... Why?
        sl<SettingsService>().appMainPage = MockNavigatorProvider(
            navigator: mockNavigator,
            child: BlocProvider<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>.value(
              value: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc,
              child: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage(title: ItgLocalization.tr('{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item'), item: tData),
            )
        );

        await widgetTester.pumpWidgetUnderTest();
        await widgetTester.pumpAndSettle();

        await widgetTester.tapOnWidget(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-$keyFloatingActionDelete'));
        await widgetTester.tapOnWidgetByText('OK');
        await widgetTester.pumpAndSettle();
        await widgetTester.pumpAndSettle();
        await widgetTester.pumpAndSettle();

        verify(() => mockNavigator.pop(any<dynamic>())).called(1);
      }, skip: false);
    });

    testWidgets('NISP action refresh', (widgetTester) async {
      // if (sl.isRegistered<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>()) {
      //   sl.unregister<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>();
      // }
      // // sl.registerLazySingleton<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support);
      // sl.registerLazySingleton<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>(() => Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support());
      //
      // when(() => sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>().actionItemRefresh(data: any(named: "data")))
      //   .thenAnswer((_) => Future.value(true));
      // when(() => sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>().allowRefresh).thenReturn(true);

      await widgetTester.pumpWidgetUnderTest();
      await widgetTester.pumpAndSettle();

      await widgetTester.tapOnWidget(Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-$keyFloatingActionRefresh'));
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage), findsOneWidget);
      expect(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}Page), findsNothing);
      expect(find.text(textSampleContent), findsNothing);

      // verify(() => sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>().actionItemRefresh(data: any(named: "data"))).called(1);
      // verify(() => sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>().allowRefresh).called(1);
    });
  });
}