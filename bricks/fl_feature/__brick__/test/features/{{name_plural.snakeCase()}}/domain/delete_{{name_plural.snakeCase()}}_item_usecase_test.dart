import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/core/error/failures.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/delete_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_usecase.dart';
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

  Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase createSubject() => Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase(mockRepository);

  group('Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase', () {
    test('D{{#upperCase}}{{abbreviation}}{{/upperCase}}IUC constructor works properly', () {
      expect(createSubject, returnsNormally);
    });

    group('D{{#upperCase}}{{abbreviation}}{{/upperCase}}IUC delete', () {
      test('D{{#upperCase}}{{abbreviation}}{{/upperCase}}IUC delete makes correct repository request', () {
        when(() => mockRepository.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(any()))
            .thenAnswer((_) async => const Right(null));
        final subject = createSubject();
        expect(subject(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId), completes);
        verify(() => mockRepository.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId)).called(1);
      });

      test('D{{#upperCase}}{{abbreviation}}{{/upperCase}}IUC should delete {{#camelCase}}{{name_plural}}{{/camelCase}}Item (repository)', () async {
        when(() => mockRepository.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(any()))
          .thenAnswer((_) async => const Right(null));
        final subject = createSubject();
        final result = await subject(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId);
        expect(result, const Right(null));
        verify(() => mockRepository.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId));
        verifyNoMoreInteractions(mockRepository);
      });

      test('D{{#upperCase}}{{abbreviation}}{{/upperCase}}IUC save should return ServerFailure from the repository if some error occurred', () async {
          when(() => mockRepository.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(any()))
              .thenAnswer((_) async => const Left(ServerFailure(code: "111")));
          final subject = createSubject();
          final result = await subject(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId);
          expect(result, const Left(ServerFailure(code: "111")));
          verify(() => mockRepository.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId));
          verifyNoMoreInteractions(mockRepository);
        },
      );
    });
  });
}
