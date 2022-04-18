import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/core/error/failures.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/core/usecase/usecase.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/get_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  late Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Repository mockRepository;

  setUp(() {
    mockRepository = Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Repository();
  });

  Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase createSubject() => Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase(mockRepository);

  final t{{#pascalCase}}{{name_plural}}{{/pascalCase}} = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData();

  group('Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase', () {
    test('GCCUC constructor works properly', () {
      expect(createSubject, returnsNormally);
    });

    group('GCCUC get', () {
      test('GCCUC get makes correct repository request', () {
        when(() => mockRepository.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}())
            .thenAnswer((_) async => Right(t{{#pascalCase}}{{name_plural}}{{/pascalCase}}));
        final subject = createSubject();
        expect(subject(NoParams()), completes);
        verify(() => mockRepository.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}()).called(1);
      });

      test('GCCUC should get {{#snakeCase}}{{name_plural}}{{/snakeCase}} from the repository', () async {
        when(() => mockRepository.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}())
            .thenAnswer((_) async => Right(t{{#pascalCase}}{{name_plural}}{{/pascalCase}}));
        final subject = createSubject();
        final result = await subject(NoParams());
        expect(result, Right(t{{#pascalCase}}{{name_plural}}{{/pascalCase}}));
        verify(() => mockRepository.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}());
        verifyNoMoreInteractions(mockRepository);
      });

      test('GCCUC should get ServerFailure from the repository if some error occurred', () async {
        when(() => mockRepository.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}())
            .thenAnswer((_) async => const Left(ServerFailure(code: "111")));
        final subject = createSubject();
        final result = await subject(NoParams());
        expect(result, const Left(ServerFailure(code: "111")));
        verify(() => mockRepository.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}());
        verifyNoMoreInteractions(mockRepository);
      });
    });
  });

}
