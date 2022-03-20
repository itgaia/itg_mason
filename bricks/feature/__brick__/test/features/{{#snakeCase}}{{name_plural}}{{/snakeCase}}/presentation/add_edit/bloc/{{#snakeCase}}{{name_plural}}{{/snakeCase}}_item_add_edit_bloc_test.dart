import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dev_framework_tutorial/src/core/error/failures.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc', () {
    late MockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase;
    late {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model data;

    setUpAll(() {
      registerFallbackValue(Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item());
    });

    setUp(() {
      data = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData().first;
      mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase = MockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase();
    });

    {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc buildBloc() {
      return {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc(
        save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase: mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase,
        initialData: null,
      );
    }

    group('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEB constructor', () {
      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEBC works properly', () {
        expect(buildBloc, returnsNormally);
      });

      test('{{#upperCase}}{{abbreviation}}{{/upperCase}}IAEBC has correct initial state', () {
        expect(
          buildBloc().state,
          equals(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState()),
        );
      });
    });

    group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent', () {
      blocTest<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState>(
        'emits new state with updated code',
        build: buildBloc,
        act: (bloc) =>
            bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent('new code')),
        expect: () => const [
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(description: 'new code'),
        ],
      );
    });

    group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditContentChangedEvent', () {
      blocTest<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState>(
        'emits new state with updated {{#snakeCase}}{{name_plural}}{{/snakeCase}}',
        build: buildBloc,
        act: (bloc) =>
            bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditContentChangedEvent('new {{#snakeCase}}{{name_plural}}{{/snakeCase}}')),
        expect: () => const [
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(content: 'new {{#snakeCase}}{{name_plural}}{{/snakeCase}}'),
        ],
      );
    });

    group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent', () {
      blocTest<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState>(
        'attempts to save new item to repository '
        'if no initial data was provided',
        setUp: () {
          when(() => mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase(any())).thenAnswer((_) async => Right(data));
        },
        build: buildBloc,
        seed: () => const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
          description: 'description',
          content: 'content',
        ),
        act: (bloc) => bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent()),
        expect: () => const [
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
            status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.submitting,
            description: 'description',
            content: 'content',
          ),
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
            status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.success,
            description: 'description',
            content: 'content',
          ),
        ],
        verify: (bloc) {
          verify(() => mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase(any(
                that: isA<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>()
                    .having((t) => t.description, 'description', equals('description'))
                    .having((t) => t.content, 'content', equals('content'),
                ),
              ),
            ),
          ).called(1);
        },
      );

      blocTest<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState>(
        'attempts to save updated item to repository '
        'if initial data was provided',
        setUp: () {
          when(() => mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase(any())).thenAnswer((_) async => Right(data));
        },
        build: buildBloc,
        seed: () => const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
          initialData: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
            id: 'initial-id',
            description: 'initial-description',
          ),
          description: 'description',
          content: 'content',
        ),
        act: (bloc) => bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent()),
        expect: () => [
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
            status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.submitting,
            initialData: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
              id: 'initial-id',
              description: 'initial-description',
            ),
            description: 'description',
            content: 'content',
          ),
          const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
            status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.success,
            initialData: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
              id: 'initial-id',
              description: 'initial-description',
            ),
            description: 'description',
            content: 'content',
          ),
        ],
        verify: (bloc) {
          verify(() => mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase(any(
                that: isA<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>()
                    .having((t) => t.id, 'id', equals('initial-id'))
                    .having((t) => t.description, 'description', equals('description'))
                    .having((t) => t.content, 'content', equals('content'),
                ),
              ),
            ),
          );
        },
      );

      blocTest<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState>(
        'emits new state with error if save to repository fails',
        build: () {
          when(() => mockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase(any()))
              // .thenThrow(Exception('oops'));
            .thenAnswer((_) async => const Left(ServerFailure()));
          return buildBloc();
        },
        seed: () => const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
          description: 'description',
          content: 'content',
        ),
        act: (bloc) => bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent()),
        expect: () => const [
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
            status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.submitting,
            description: 'description',
            content: 'content',
          ),
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
            status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.failure,
            description: 'description',
            content: 'content',
          ),
        ],
      );
    });
  });
}