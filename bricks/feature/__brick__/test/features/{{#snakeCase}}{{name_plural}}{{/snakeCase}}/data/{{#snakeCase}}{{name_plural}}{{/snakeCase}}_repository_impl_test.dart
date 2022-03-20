import 'package:dev_framework_tutorial/src/app/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dev_framework_tutorial/src/core/error/exception.dart';
import 'package:dev_framework_tutorial/src/core/error/failures.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_local_datasource.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_remote_datasource.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_repository_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

const sampleData = '''[
  {
    "_id": {"\$oid":"61011f6d4558ebe4f88abc1"},
    "description": "test description 1",
    "content": "test content 1"
  },
  {
    "_id": {"\$oid":"61011f6d4558ebe4f88abc2"},
    "description": "test description 2",
    "content": "test content 2"
  },
  {
    "_id": {"\$oid":"61011f6d4558ebe4f88abc3"},
    "description": "test description 3",
    "content": "test content 3"
  }
]''';


void main() {
  late {{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSource mockRemoteDataSource;
  late {{#pascalCase}}{{name_plural}}{{/pascalCase}}LocalDataSource mockLocalDataSource;
  // late MockNetworkInfo mockNetworkInfo;

  setUpAll(() {
    registerFallbackValue(Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item());
  });

  setUp(() {
    mockRemoteDataSource = Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSource();
    mockLocalDataSource = Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}LocalDataSource();
    // mockNetworkInfo = MockNetworkInfo();
  });

  {{#pascalCase}}{{name_plural}}{{/pascalCase}}RepositoryImpl createSubject() => {{#pascalCase}}{{name_plural}}{{/pascalCase}}RepositoryImpl(
    remoteDataSource: mockRemoteDataSource,
    localDataSource: mockLocalDataSource,
    // networkInfo: mockNetworkInfo,
  );

  void _runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        // when(() => mockNetworkInfoIsConnected).thenAnswer((_) async => true);
        networkInfoIsConnected = Future.value(true);
      });

      body();
    });
  }

  void _runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        // when(() => mockNetworkInfoIsConnected).thenAnswer((_) async => false);
        networkInfoIsConnected = Future.value(false);
      });

      body();
    });
  }

  group('{{#pascalCase}}{{name_plural}}{{/pascalCase}}RepositoryImpl constructor', () {
    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI constructor works properly', () {
      expect(createSubject, returnsNormally);
    });
  });

  group('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI get{{#pascalCase}}{{name_plural}}{{/pascalCase}}', () {
    final t{{#pascalCase}}{{name_plural}}{{/pascalCase}}ModelList = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData();
    final List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> t{{#pascalCase}}{{name_plural}}{{/pascalCase}}EntityList = t{{#pascalCase}}{{name_plural}}{{/pascalCase}}ModelList;

    // test('should check if the device is online', () {
    //   // arrange
    //   // when(() => mockNetworkInfoIsConnected).thenAnswer((_) async => true);
    //   // don't know why this makes the test pass...
    //   when(() => mockRemoteDataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}())
    //     .thenAnswer((_) async => t{{#pascalCase}}{{name_plural}}{{/pascalCase}}ModelList);
    //   when(() => mockLocalDataSource
    //     .cache{{#pascalCase}}{{name_plural}}{{/pascalCase}}(t{{#pascalCase}}{{name_plural}}{{/pascalCase}}EntityList as List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>))
    //     .thenAnswer((_) async => t{{#pascalCase}}{{name_plural}}{{/pascalCase}}ModelList);
    //   // act
    //   repository.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
    //   // assert
    //   verify(() => mockNetworkInfoIsConnected);
    // });

    _runTestsOnline(() {
      group('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI get (RemoteDataSource)', () {
        test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI get should return remote data when the call to remote data source is successful', () async {
          when(() => mockRemoteDataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}())
            .thenAnswer((_) async => t{{#pascalCase}}{{name_plural}}{{/pascalCase}}ModelList);
          when(() => mockLocalDataSource.cache{{#pascalCase}}{{name_plural}}{{/pascalCase}}(t{{#pascalCase}}{{name_plural}}{{/pascalCase}}EntityList))
            .thenAnswer((_) async => t{{#pascalCase}}{{name_plural}}{{/pascalCase}}ModelList);
          final subject = createSubject();
          final result = await subject.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
          verify(() => mockRemoteDataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}());
          expect(result, equals(Right(t{{#pascalCase}}{{name_plural}}{{/pascalCase}}EntityList)));
        });

        test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI get should cache the data locally when the call to remote data source is successful', () async {
          when(() => mockRemoteDataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}())
            .thenAnswer((_) async => t{{#pascalCase}}{{name_plural}}{{/pascalCase}}ModelList);
          when(() => mockLocalDataSource.cache{{#pascalCase}}{{name_plural}}{{/pascalCase}}(t{{#pascalCase}}{{name_plural}}{{/pascalCase}}EntityList))
            .thenAnswer((_) async => t{{#pascalCase}}{{name_plural}}{{/pascalCase}}ModelList);
          final subject = createSubject();
          await subject.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
          verify(() => mockRemoteDataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}());
          verify(() => mockLocalDataSource
            .cache{{#pascalCase}}{{name_plural}}{{/pascalCase}}(t{{#pascalCase}}{{name_plural}}{{/pascalCase}}EntityList));
        });

        test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI get should return server failure when the call to remote data source is unsuccessful', () async {
          when(() => mockRemoteDataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}())
            .thenThrow(const ServerException(code: "111"));
          final subject = createSubject();
          final result = await subject.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
          verify(() => mockRemoteDataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(const Left(ServerFailure(code: '111'))));
        });
      });
    });

    _runTestsOffline(() {
      group('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI get (LocalDataSource)', () {
        test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI get should return local data when the call to local data source is successful', () async {
          SharedPreferences.setMockInitialValues({cached{{#pascalCase}}{{name_plural}}{{/pascalCase}}Key: sampleData});
          when(() => mockLocalDataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}())
            .thenAnswer((_) async => t{{#pascalCase}}{{name_plural}}{{/pascalCase}}ModelList);
          final subject = createSubject();
          final result = await subject.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
          verify(() => mockLocalDataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}());
          expect(result, equals(Right(t{{#pascalCase}}{{name_plural}}{{/pascalCase}}EntityList)));
        });

        test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI get should return server failure when the call to local data source is unsuccessful', () async {
          when(() => mockLocalDataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}())
            .thenThrow(const CacheException(code: "111"));
          final subject = createSubject();
          final result = await subject.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
          verify(() => mockLocalDataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}());
          verifyZeroInteractions(mockRemoteDataSource);
          expect(result, equals(Left(CacheFailure())));
        });
      });
    });
  });

  group('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item', () {
    _runTestsOnline(() {
      group('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI save', () {
        final List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> tItems = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData();
        final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model tItem = tItems.first;

        test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI save makes correct repository request (create)', () async {
          const newItem = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
            description: 'description 4',
            content: 'content 4',
          );
          when(() => mockLocalDataSource.cache{{#pascalCase}}{{name_plural}}{{/pascalCase}}(any()))
              .thenAnswer((_) async => {});
          when(() => mockLocalDataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}())
              .thenAnswer((_) async => tItems);
          when(() => mockRemoteDataSource.create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(any()))
              .thenAnswer((_) async => newItem);
          final subject = createSubject();
          expect(subject.save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(newItem), completes);
          expect(await subject.save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(newItem), equals(const Right(newItem)));
          if (await networkInfoIsConnected) {
            verify(() => mockRemoteDataSource.create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(newItem)).called(2);
          }
        });

        test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI save makes correct repository request (update)', () async {
          const newItem = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
            id: '4',
            description: 'description 4',
            content: 'content 4',
          );
          when(() => mockRemoteDataSource.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(any()))
              .thenAnswer((_) async => tItem);
          final subject = createSubject();
          expect(subject.save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(newItem), completes);
          expect(await subject.save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(newItem), equals(Right(tItem)));
          verify(() => mockRemoteDataSource.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(newItem)).called(2);
        });

        test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI save should return remote data when the call to remote data source is successful', () async {
          when(() => mockRemoteDataSource.create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(any()))
            .thenAnswer((_) async => tItem);
          when(() => mockRemoteDataSource.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(any()))
            .thenAnswer((_) async => tItem);
          // when(() => mockLocalDataSource
          //   .cache{{#pascalCase}}{{name_plural}}{{/pascalCase}}(t{{#pascalCase}}{{name_plural}}{{/pascalCase}}EntityList))
          //   .thenAnswer((_) async => t{{#pascalCase}}{{name_plural}}{{/pascalCase}}ModelList);
          final subject = createSubject();
          final result = await subject.save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(tItem);
          verify(() => mockRemoteDataSource.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(tItem));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Right(tItem)));
        });

        test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI save should return server failure when the call to remote data source is unsuccessful', () async {
          when(() => mockRemoteDataSource.create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(any()))
            .thenThrow(const ServerException(code: "111"));
          when(() => mockRemoteDataSource.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(any()))
            .thenThrow(const ServerException(code: "111"));
          final subject = createSubject();
          final result = await subject.save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(tItem);
          verify(() => mockRemoteDataSource.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(tItem));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(const Left(ServerFailure(code: '111'))));
        });
      });
    });
  });

  group('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item', () {

    _runTestsOnline(() {
      group('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI delete', () {
        final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model tData = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData().first;

        test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI delete makes correct repository request', () async {
          when(() => mockRemoteDataSource.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(any()))
              .thenAnswer((_) async {});
          final subject = createSubject();
          expect(subject.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId), completes);
          expect(await subject.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId), equals(const Right(null)));
          verify(() => mockRemoteDataSource.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId)).called(2);
        });

        test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RI delete should return server failure when the call to remote data source is unsuccessful', () async {
          when(() => mockRemoteDataSource.create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(any()))
            .thenThrow(const ServerException(code: "111"));
          when(() => mockRemoteDataSource.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(any()))
            .thenThrow(const ServerException(code: "111"));
          final subject = createSubject();
          final result = await subject.save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(tData);
          verify(() => mockRemoteDataSource.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(tData));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(const Left(ServerFailure(code: '111'))));
        });
      });
    });
  });
}
