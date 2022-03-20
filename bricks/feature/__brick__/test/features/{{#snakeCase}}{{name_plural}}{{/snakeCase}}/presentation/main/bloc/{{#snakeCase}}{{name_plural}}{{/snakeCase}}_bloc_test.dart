import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dev_framework_tutorial/src/app/injection_container.dart';
import 'package:dev_framework_tutorial/src/core/error/failures.dart';
import 'package:dev_framework_tutorial/src/core/usecase/usecase.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/delete_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_usecase.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/save_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_usecase.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_bloc.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_list_filter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  final tItems = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData();
  final tItem = tItems.first;
  // late {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc bloc;
  late MockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase;
  late Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase;
  late Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase mockDelete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase;

  setUpAll(() {
    registerFallbackValue(NoParams());
    registerFallbackValue(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(description: '111'));
  });

  setUp(() {
    mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase = MockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase();
    // bloc = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc({{#snakeCase}}{{name_plural}}{{/snakeCase}}: mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase);
    if (!sl.isRegistered<Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase>()) {
      mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase = MockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase();
      sl.registerLazySingleton<Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase>(() => mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase);
    } else {
      mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase = sl<Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase>();
    }
    if (!sl.isRegistered<Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase>()) {
      mockDelete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase = MockDelete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase();
      sl.registerLazySingleton<Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase>(() => mockDelete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase);
    } else {
      mockDelete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase = sl<Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase>();
    }
  });

  {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc buildBloc() {
    return {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc(usecase: mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase);
  }

  group('{{#upperCase}}{{abbreviation}}{{/upperCase}}B constructor', () {
    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}B works properly', () => expect(buildBloc, returnsNormally));

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}B has correct initial state', () {
      expect(buildBloc().state, equals(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State()));
    });
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent', () {
    blocTest<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}State>(
      '{{#upperCase}}{{abbreviation}}{{/upperCase}}B starts listening to Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase stream',
      // build: buildBloc,
      build: () {
        when(() => mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase.call(any()))
            .thenAnswer((_) async => Right(tItems));
        return buildBloc();
      },
      act: (bloc) => bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent()),
      verify: (bloc) {
        verify(() => mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase(NoParams())).called(1);
      }
    );

    blocTest<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}State>(
      '{{#upperCase}}{{abbreviation}}{{/upperCase}}B emits state with updated status and items '
      'when Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase stream emits new items',
      // build: buildBloc,
      build: () {
        when(() => mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase.call(any()))
            .thenAnswer((_) async => Right(tItems));
        return buildBloc();
      },
      act: (bloc) => bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent()),
      expect: () => [
        const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(
          status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.loading,
        ),
        {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(
          status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.success,
          items: tItems,
        ),
      ],
    );

    blocTest<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}State>(
      '{{#upperCase}}{{abbreviation}}{{/upperCase}}B emits state with failure status '
      'when Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase stream emits error',
      setUp: () {
        when(() => mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase(any()))
          // .thenAnswer((_) => Stream.error(Exception('oops')));
          .thenAnswer((_) async => const Left(ServerFailure()));
      },
      build: buildBloc,
      act: (bloc) => bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent()),
      expect: () => [
        const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.loading),
        const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.failure),
      ],
    );
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSavedEvent', () {
    blocTest<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}State>(
      'saves item using repository',
      // build: buildBloc,
      build: () {
        when(() => mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase.call(any()))
            .thenAnswer((_) async => Right(tItem));
        return buildBloc();
      },
      act: (bloc) => bloc.add({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSavedEvent(tItem)),
      verify: (bloc) {
        verify(() => mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase(tItem)).called(1);
      },
    );
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDeletedEvent', () {
    blocTest<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}State>(
      'deletes item using usecase',
      // build: buildBloc,
      build: () {
        when(() => mockDelete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase.call(any()))
            .thenAnswer((_) async => const Right(null));
        return buildBloc();
      },
      seed: () => {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(items: tItems),
      act: (bloc) => bloc.add({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDeletedEvent(tItem)),
      verify: (bloc) {
        verify(() => mockDelete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase(tItem.id!)).called(1);
      },
    );
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUndoDeletionRequestedEvent', () {
    blocTest<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}State>(
      'restores last deleted undo and clears lastDeletedUndo field',
      // build: buildBloc,
      build: () {
        when(() => mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase.call(any()))
            .thenAnswer((_) async => Right(tItem));
        return buildBloc();
      },
      seed: () => {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(lastDeletedItem: tItem),
      act: (bloc) => bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUndoDeletionRequestedEvent()),
      expect: () => const [{{#pascalCase}}{{name_plural}}{{/pascalCase}}State()],
      verify: (bloc) {
        verify(() => mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase(tItem)).called(1);
      },
    );
  });

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}FilterChangedEvent', () {
    blocTest<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}State>(
      'emits state with updated filter',
      build: buildBloc,
      act: (bloc) => bloc.add(
        const {{#pascalCase}}{{name_plural}}{{/pascalCase}}FilterChangedEvent({{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.latest),
      ),
      expect: () => const [
        {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(filter: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.latest),
      ],
    );
  });
}
