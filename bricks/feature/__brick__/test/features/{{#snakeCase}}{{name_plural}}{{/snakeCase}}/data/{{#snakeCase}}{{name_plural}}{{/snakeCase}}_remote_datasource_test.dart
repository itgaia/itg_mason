import 'dart:convert';

import 'package:dev_framework_tutorial/src/app/constants.dart';
import 'package:dev_framework_tutorial/src/common/helper.dart';
import 'package:dev_framework_tutorial/src/core/error/exception.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:dev_framework_tutorial/src/app/injection_container.dart';
import 'package:dev_framework_tutorial/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_remote_datasource.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../../common/test_helper.dart';
import '../../../fixtures/fixture_helper.dart';
import '../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_test_helper.dart';

void main() {
  late {{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSourceImpl dataSource;

  setUpAll(() {
    sl.registerLazySingleton<http.Client>(() => MockHttpClient());
  });

  setUp(() {
    dataSource = {{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSourceImpl(client: sl<http.Client>());
  });

  group('get{{#pascalCase}}{{name_plural}}{{/pascalCase}}', () {
    test('should perform a GET request on a URL with application/json header', () {
      setUpHttpClientGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Success200(url: url{{#pascalCase}}{{name_plural}}{{/pascalCase}});
      dataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
      verify(() => sl<http.Client>()
          .get(Uri.parse(url{{#pascalCase}}{{name_plural}}{{/pascalCase}}), headers: {'Content-Type': 'application/json'}));
        });

    // final t{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model = (json.decode(fixture('{{#snakeCase}}{{name_plural}}{{/snakeCase}}_fixture.json')) as List)
    final t{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model = (json.decode(fixture('{{#snakeCase}}{{name_plural}}{{/snakeCase}}_response_fixture.json')) as List)
        .map<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>((json) => {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model.fromJson(json)).toList();

    test('should return {{#pascalCase}}{{name_plural}}{{/pascalCase}} when the response code is 200', () async {
      setUpHttpClientGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Success200();
      final result = await dataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
      itgLogVerbose('test - {{#pascalCase}}{{name_plural}}{{/pascalCase}} - result: $result');
      itgLogVerbose('test - {{#pascalCase}}{{name_plural}}{{/pascalCase}} - t{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model: $t{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model');
      expect(result, equals(t{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model));
    });

    test(
        'should return a ServerException when the response code is 404 or other',
            () async {
          arrangeHttpClientGetReturnFailure404(url: url{{#pascalCase}}{{name_plural}}{{/pascalCase}});
          final call = dataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}};
          expect(() => call(), throwsA(isA<ServerException>()));
          expect(() async => await call(), throwsA(const ServerException(description: 'Invalid response "404"...')));
        });

    test(
        'should return a ServerException when an exception occurs',
            () async {
          arrangeHttpClientGetReturnException(url: url{{#pascalCase}}{{name_plural}}{{/pascalCase}});
          final call = dataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}};
          expect(() => call(), throwsA(isA<ServerException>()));
          expect(() => call(), throwsA(const ServerException(description: 'Exception: $textSampleException')));
        });
  });

  group('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item', () {
    final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model tData = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData().first;
    // const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model tData = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(code: 'test code 1', id: r'{$oid: 1}', dtFill: '2021-1-1', dtEmpty: '', dtDisinfection: '', {{#snakeCase}}{{name_plural}}{{/snakeCase}}: 'test {{#snakeCase}}{{name_plural}}{{/snakeCase}} 1', createdAt: '', updatedAt: '');

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS create should perform a POST request on a URL with application/json header', () {
      setUpHttpClientCreate{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSuccess200(url: url{{#pascalCase}}{{name_plural}}{{/pascalCase}});
      dataSource.create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(tData);
      verify(() => sl<http.Client>().post(
          Uri.parse(url{{#pascalCase}}{{name_plural}}{{/pascalCase}}),
          headers: {'Content-Type': 'application/json'},
          // body: tData.toJson()
          body: r'{"_id":"1","description":"test description 1","content":"test content 1"}'
      ));
    }, skip: !useHttpClient);

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS create should return the item with id and dates when the response code is 200', () async {
      setUpHttpClientCreate{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSuccess200();
      final result = await dataSource.create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(item{{#pascalCase}}{{name_plural}}{{/pascalCase}}AddTestData);
      expect(result, equals(item{{#pascalCase}}{{name_plural}}{{/pascalCase}}AddTestDataExpected));
    }, skip: !useHttpClient);

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS create should return a ServerException when the response code is 404 or other', () async {
      arrangeHttpClientPostReturnFailure404(url: url{{#pascalCase}}{{name_plural}}{{/pascalCase}});
      final call = dataSource.create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item;
      expect(() => call(tData), throwsA(isA<ServerException>()));
      expect(() async => await call(tData), throwsA(const ServerException(description: '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSourceImpl.create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item] Failed tp create item with response code "404"...')));
      // expect(() async => await call(), throwsA(ServerException()));
    });

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS create should return a ServerException when an exception occurs', () async {
      arrangeHttpClientPostReturnException(url: url{{#pascalCase}}{{name_plural}}{{/pascalCase}});
      final call = dataSource.create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item;
      expect(() => call(tData), throwsA(isA<ServerException>()));
      expect(() => call(tData), throwsA(const ServerException(description: 'Exception: $textSampleException')));
    });
  });

  group('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item', () {
    final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model tData = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData().first;
    final String tUrl = '$url{{#pascalCase}}{{name_plural}}{{/pascalCase}}/${tData.id}';
    itgLogVerbose('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item - tUrl: $tUrl');
    itgLogVerbose('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item - tData: $tData');

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS update should perform a PUT request on a URL with application/json header', () {
      setUpHttpClientUpdate{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSuccess204(url: tUrl, data: tData);
      dataSource.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(tData);
      verify(() => sl<http.Client>().put(
          Uri.parse(tUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(tData.toJson())
      ));
    });

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS update should return the item with id and dates when the response code is 204', () async {
      setUpHttpClientUpdate{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSuccess204(url: tUrl, data: tData);
      final result = await dataSource.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(tData);
      expect(result, equals(tData));
    });

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS update should return a ServerException when the response code is 404 or other', () async {
      arrangeHttpClientPutReturnFailure404(url: tUrl);
      final call = dataSource.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item;
      expect(() => call(tData), throwsA(isA<ServerException>()));
      expect(() async => await call(tData), throwsA(const ServerException(description: '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSourceImpl.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item] Failed tp update item with response code "404"...')));
    });

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS update should return a ServerException when an exception occurs', () async {
      arrangeHttpClientPutReturnException(url: tUrl);
      final call = dataSource.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item;
      expect(() => call(tData), throwsA(isA<ServerException>()));
      expect(() => call(tData), throwsA(const ServerException(description: 'Exception: $textSampleException')));
    });
  });

  group('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item', () {
    // final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model tData = {{#snakeCase}}{{name_plural}}{{/snakeCase}}TestData().first;
    const String tUrl = '$url{{#pascalCase}}{{name_plural}}{{/pascalCase}}/$sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId';

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS delete should perform a DELETE request on a URL with application/json header', () {
      setUpHttpClientDelete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSuccess204(url: tUrl);
      dataSource.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId);
      verify(() => sl<http.Client>().delete(
        Uri.parse(tUrl),
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS delete should return a ServerException when the response code is 404 or other', () async {
      arrangeHttpClientDeleteReturnFailure404(url: tUrl);
      final call = dataSource.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item;
      expect(() => call(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId), throwsA(isA<ServerException>()));
      expect(() async => await call(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId), throwsA(const ServerException(description: '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSourceImpl.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item] Failed tp delete item "$sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId" with response code "404"...')));
    });

    test('{{#upperCase}}{{abbreviation}}{{/upperCase}}RDS delete should return a ServerException when an exception occurs', () async {
      arrangeHttpClientDeleteReturnException(url: tUrl);
      final call = dataSource.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item;
      expect(() => call(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId), throwsA(isA<ServerException>()));
      expect(() => call(sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId), throwsA(const ServerException(description: 'Exception: $textSampleException')));
    });
  });
}
