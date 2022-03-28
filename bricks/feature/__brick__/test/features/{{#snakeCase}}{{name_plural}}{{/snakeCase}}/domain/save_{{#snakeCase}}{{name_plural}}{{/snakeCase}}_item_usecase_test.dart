import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dev_framework_tutorial/src/core/error/failures.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/save_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_usecase.dart';
import 'package:mockingjay/mockingjay.dart';

import '../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  late Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Repository mockRepository;

  setUpAll(() {
    registerFallbackValue(Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item());
  });

  setUp(() {
    mockRepository = Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Repository();
  });

  Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase createSubject() => Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase(mockRepository);

  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model tData = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData().first;

  group('Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase', () {
    test('S{{#upperCase}}{{abbreviation}}{{/upperCase}}IUC constructor works properly', () {
      expect(createSubject, returnsNormally);
    });

    group('S{{#upperCase}}{{abbreviation}}{{/upperCase}}IUC save', () {
      test('S{{#upperCase}}{{abbreviation}}{{/upperCase}}IUC save makes correct repository request', () {
        final newItem = item{{#pascalCase}}{{name_plural}}{{/pascalCase}}UpdateTestData;
        when(() => mockRepository.save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(any()))
            .thenAnswer((_) async => Right(tData));
        final subject = createSubject();
        expect(subject(newItem), completes);
        verify(() => mockRepository.save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(newItem)).called(1);
      });

      test('S{{#upperCase}}{{abbreviation}}{{/upperCase}}IUC should save {{#snakeCase}}{{name_plural}}{{/snakeCase}}Item (repository)', () async {
        when(() => mockRepository.save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(any()))
          .thenAnswer((_) async => Right(tData));
        final subject = createSubject();
        final result = await subject(tData);
        expect(result, Right(tData));
        verify(() => mockRepository.save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(tData));
        verifyNoMoreInteractions(mockRepository);
      });

      test('S{{#upperCase}}{{abbreviation}}{{/upperCase}}IUC save should return ServerFailure from the repository if some error occurred', () async {
        when(() => mockRepository.save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(any()))
            .thenAnswer((_) async => const Left(ServerFailure(code: "111")));
        final subject = createSubject();
        final result = await subject(tData);
        expect(result, const Left(ServerFailure(code: "111")));
        verify(() => mockRepository.save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(tData));
        verifyNoMoreInteractions(mockRepository);
      });
    });
  });
}
