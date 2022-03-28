import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dev_framework_tutorial/src/app/injection_container.dart';
import 'package:dev_framework_tutorial/src/core/usecase/usecase.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_support.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/get_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_usecase.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_page.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_bloc.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_page.dart';
import 'package:dev_framework_tutorial/src/features/settings/settings_service.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../../common/test_helper.dart';
import '../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {{#snakeCase}}{{name_singular}}{{/snakeCase}} = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData().first;
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc = Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc();
  final tItems = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData();
  final tItem = tItems.first;

  late MockNavigator mockNavigator;
  late {{#pascalCase}}{{name_plural}}{{/pascalCase}}Support {{#snakeCase}}{{name_plural}}{{/snakeCase}}Support;
  late {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc;

  setUpAll(() {
    registerFallbackValue(NoParams());
  });

  setUp(() async {
    {{#snakeCase}}{{name_plural}}{{/snakeCase}}Support = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Support();
    mockNavigator = MockNavigator();
    when(() => mockNavigator.push(any())).thenAnswer((_) async => null);

    when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent()))
        .thenAnswer((_) async { });

    mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc = Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc();
    when(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc.state).thenReturn(
        {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
            initialData: {{#snakeCase}}{{name_singular}}{{/snakeCase}},
            {{#fields}}{{#camelCase}}{{field_name}}{{/camelCase}}: {{#snakeCase}}{{name_singular}}{{/snakeCase}}.{{#camelCase}}{{field_name}}{{/camelCase}},{{^is_last}}
            {{/is_last}}{{/fields}}
        )
    );

    if (sl.isRegistered<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>()) {
      sl.unregister<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>();
    }
    sl.registerLazySingleton<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>(() => MockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase());
    when(() => sl<Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase>()(any()))
        .thenAnswer((_) async => Right(tItems));

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

  group('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actions', () {
    Future<BuildContext> prepareSubject({required WidgetTester widgetTester}) async {
      sl<SettingsService>().appMainPage = MockNavigatorProvider(
        navigator: mockNavigator,
        child: BlocProvider.value(
          value: mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc,
          child: const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Page(),
        ),
      );
      await widgetTester.pumpWidgetUnderTest();
      return widgetTester.element(find.byType({{#pascalCase}}{{name_plural}}{{/pascalCase}}Page));
    }

    group('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemAdd', () {
      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemAdd - check result', (widgetTester) async {
        expect(await {{#snakeCase}}{{name_plural}}{{/snakeCase}}Support.actionItemAdd(
            context: await prepareSubject(widgetTester: widgetTester)
        ), equals(null));
      });

      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemAdd - check refresh', (widgetTester) async {
        final BuildContext context = await prepareSubject(widgetTester: widgetTester);
        await {{#snakeCase}}{{name_plural}}{{/snakeCase}}Support.actionItemAdd(context: context);
        verify(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent())).called(2);
      });
    });

    group('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemDuplicate', () {
      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemDuplicate - check result', (widgetTester) async {
        expect(await {{#snakeCase}}{{name_plural}}{{/snakeCase}}Support.actionItemDuplicate(
            context: await prepareSubject(widgetTester: widgetTester),
            data: tItem
        ), equals(null));
      });

      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemDuplicate - check refresh', (widgetTester) async {
        final BuildContext context = await prepareSubject(widgetTester: widgetTester);
        await {{#snakeCase}}{{name_plural}}{{/snakeCase}}Support.actionItemDuplicate(context: context, data: tItem);
        verify(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent())).called(2);
      });
    });

    group('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemEdit', () {
      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemEdit - check result', (widgetTester) async {
        expect(await {{#snakeCase}}{{name_plural}}{{/snakeCase}}Support.actionItemEdit(
            context: await prepareSubject(widgetTester: widgetTester),
            data: tItem
        ), equals(null));
      });

      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemEdit - check refresh', (widgetTester) async {
        final BuildContext context = await prepareSubject(widgetTester: widgetTester);
        await {{#snakeCase}}{{name_plural}}{{/snakeCase}}Support.actionItemEdit(context: context, data: tItem);
        verify(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent())).called(2);
      }, skip: true);
    });

    group('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemDelete', () {
      // TODO: How can I mock confirm_dialog? Should I mock {{#pascalCase}}{{name_plural}}{{/pascalCase}}Support?
      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemDelete - check result', (widgetTester) async {
        expect(await {{#snakeCase}}{{name_plural}}{{/snakeCase}}Support.actionItemDelete(
            context: await prepareSubject(widgetTester: widgetTester),
            data: tItem
        ), equals(null));
      }, skip: true);

      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemDelete - check refresh', (widgetTester) async {
        final BuildContext context = await prepareSubject(widgetTester: widgetTester);
        await {{#snakeCase}}{{name_plural}}{{/snakeCase}}Support.actionItemDelete(context: context, data: tItem);
        await widgetTester.tapOnWidgetByText('OK');
        verify(() => mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent())).called(1);
      });
    }, skip: true);

    group('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemRefresh', () {
      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemRefresh - check result', (widgetTester) async {
        expect(await {{#snakeCase}}{{name_plural}}{{/snakeCase}}Support.actionItemRefresh(
          data: tItem,
          context: await prepareSubject(widgetTester: widgetTester),
        ), equals(null));
      });
    });

    group('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemsRefresh', () {
      testWidgets('{{#upperCase}}{{abbreviation}}{{/upperCase}}S actionItemsRefresh - check result', (widgetTester) async {
        expect(await {{#snakeCase}}{{name_plural}}{{/snakeCase}}Support.actionItemsRefresh(
          context: await prepareSubject(widgetTester: widgetTester),
        ), equals(null));
      });
    });
  });
}