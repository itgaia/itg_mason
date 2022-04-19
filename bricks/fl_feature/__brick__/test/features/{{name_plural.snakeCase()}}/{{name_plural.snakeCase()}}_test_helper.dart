import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/injection_container.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/common/helper.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/core/error/failures.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/core/usecase/usecase.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_local_datasource.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_remote_datasource.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/delete_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_usecase.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/get_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_usecase.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_repository.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_support.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/domain/save_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_usecase.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/add_edit/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_bloc.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/presentation/main/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../common/test_helper.dart';
import '../../fixtures/fixture_helper.dart';

class MockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase extends Mock implements Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase {}
class MockSave{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase extends Mock implements Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase {}
class MockDelete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase extends Mock implements Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase {}
class Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Repository extends Mock implements {{#pascalCase}}{{name_plural}}{{/pascalCase}}Repository {}
class Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSource extends Mock implements {{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSource {}
class Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}LocalDataSource extends Mock implements {{#pascalCase}}{{name_plural}}{{/pascalCase}}LocalDataSource {}
class Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support extends Mock implements {{#pascalCase}}{{name_plural}}{{/pascalCase}}Support {}

class Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc extends MockBloc<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Event, {{#pascalCase}}{{name_plural}}{{/pascalCase}}State> implements {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc {}
class Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}State extends Fake implements {{#pascalCase}}{{name_plural}}{{/pascalCase}}State {}
class Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}Event extends Fake implements {{#pascalCase}}{{name_plural}}{{/pascalCase}}Event {}

class Mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc extends MockBloc<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent, {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState> implements {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc {}
class Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState extends Fake implements {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState {}
class Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent extends Fake implements {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent {}

class Fake{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item extends Fake implements {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {}

{{#camelCase}}{{name_plural}}{{/camelCase}}RegisterFallbackValue() => registerFallbackValue(item{{#pascalCase}}{{name_plural}}{{/pascalCase}}Sample());

const mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
  id: '1',
  {{#fields}}{{#camelCase}}{{field_name}}{{/camelCase}}: '{{#camelCase}}{{field_name}}{{/camelCase}} 1',{{^is_last}}
  {{/is_last}}{{/fields}}
  updatedAt: '2021-09-22T07:06:52.604Z'
);
const mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Items = [mock{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item];

const String sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId = r'61011f6d4558ebe4f88acccc';
const item{{#pascalCase}}{{name_plural}}{{/pascalCase}}AddTestData = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
    {{#fields}}{{#camelCase}}{{field_name}}{{/camelCase}}: '{{#camelCase}}{{field_name}}{{/camelCase}}-sample'{{^is_last}}, {{/is_last}}{{/fields}});
final item{{#pascalCase}}{{name_plural}}{{/pascalCase}}UpdateTestData = item{{#pascalCase}}{{name_plural}}{{/pascalCase}}AddTestData.copyWith(id: '111');
const item{{#pascalCase}}{{name_plural}}{{/pascalCase}}AddTestDataExpected = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
    id: sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId, {{#fields}}{{#camelCase}}{{field_name}}{{/camelCase}}: '{{#camelCase}}{{field_name}}{{/camelCase}}-sample'{{^is_last}}, {{/is_last}}{{/fields}}, createdAt: "2021-01-01T21:21:21.21Z", updatedAt: "2021-01-01T21:21:21.21Z");

const sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}Data = '''[
  {
    "_id": {"\$oid":"61011f6d4558ebe4f88abc1"},
    "code": "test code 1", 
    "notes": "test notes 1", 
  },
  {
    "_id": {"\$oid":"61011f6d4558ebe4f88abc2"},
    "code": "test code 2", 
    "notes": "test notes 2", 
  },
  {
    "_id": {"\$oid":"61011f6d4558ebe4f88abc3"},
    "code": "test code 3", 
    "notes": "test notes 3", 
  }
]''';


List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> {{#camelCase}}{{name_plural}}{{/camelCase}}TestData({int count = 5}) => List.generate(
  count,
  (i) => {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(id: '${i+1}', {{#fields}}{{#camelCase}}{{field_name}}{{/camelCase}}: 'test {{#camelCase}}{{field_name}}{{/camelCase}} ${i+1}'{{^is_last}}, {{/is_last}}{{/fields}})
);

List<Map<String, dynamic>> {{#camelCase}}{{name_plural}}{{/camelCase}}TestMapData({int count = 5}) => List.generate(
  count,
  (i) => {'id': '${i+1}', {{#fields}}'{{#camelCase}}{{field_name}}{{/camelCase}}': 'test {{#camelCase}}{{field_name}}{{/camelCase}} ${i+1}'{{^is_last}}, {{/is_last}}{{/fields}}}
);

List<Map<String, dynamic>> {{#camelCase}}{{name_plural}}{{/camelCase}}MongoTestMapData({int count = 5}) => List.generate(
  count,
  (i) => {'_id': {r"$oid": r"61011f6d4558ebe4f88acccc"}, {{#fields}}'{{#camelCase}}{{field_name}}{{/camelCase}}': 'test {{#camelCase}}{{field_name}}{{/camelCase}} ${i+1}'{{^is_last}}, {{/is_last}}{{/fields}}}
);

extension {{#pascalCase}}{{name_plural}}{{/pascalCase}}AddedFunctionality on WidgetTester {
  Future<void> pump{{#pascalCase}}{{name_plural}}{{/pascalCase}}List({{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc bloc) async {
    itgLogVerbose('WidgetTester.pump{{#pascalCase}}{{name_plural}}{{/pascalCase}}List - start...');
    return pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: bloc,
          // child: const {{#pascalCase}}{{name_plural}}{{/pascalCase}}List(),
          child: const {{#pascalCase}}{{name_plural}}{{/pascalCase}}View(),
        ),
      ),
    );
  }
}

void arrangeReturnsN{{#pascalCase}}{{name_plural}}{{/pascalCase}}(mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase, {int count = 5}) {
  itgLogVerbose('before when....');
  when(() => mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase.call(any())).thenAnswer((_) async {
    itgLogVerbose('arrangeReturnsN{{#pascalCase}}{{name_plural}}{{/pascalCase}}........');
    await Task(() => Future.value({{#camelCase}}{{name_plural}}{{/camelCase}}TestData(count: count)))
        .attempt()
        .mapLeftToFailure()
        .map((either) =>
        either.map((data) => data as List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>))
        .run();
  });
  itgLogVerbose('after when....');
}

void arrangeReturnsN{{#pascalCase}}{{name_plural}}{{/pascalCase}}AfterNSecondsWait(
    mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase,
    {int count = 5, Duration wait = const Duration(seconds: 2)}) {
  when(() => mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase(NoParams())).thenAnswer((_) async {
    itgLogVerbose('>>> arrangeReturnsN{{#pascalCase}}{{name_plural}}{{/pascalCase}}AfterNSecondsWait - count: $count, wait: $wait - start...');
    await Future.delayed(wait);
    itgLogVerbose('>>> arrangeReturnsN{{#pascalCase}}{{name_plural}}{{/pascalCase}}AfterNSecondsWait - count: $count, wait: $wait - end...');
    // return Right({{#camelCase}}{{name_plural}}{{/camelCase}}TestData(count: count));
    return await Task(() => Future.value({{#camelCase}}{{name_plural}}{{/camelCase}}TestData(count: count)))
        .attempt()
        .mapLeftToFailure()
        .map((either) => either.map((data) => data as List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>))
        .run();
  });
}

void arrange{{#pascalCase}}{{name_plural}}{{/pascalCase}}UsecaseReturnException(
    mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase, {Duration wait = const Duration(seconds: 0)}) {
  when(() => mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase(any()))
      .thenAnswer((_) async => const Left(ServerFailure(code: '111')));
  // when(() => mockGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase(NoParams())).thenAnswer((_) async {
  //     itgLogVerbose('>>> arrange{{#pascalCase}}{{name_plural}}{{/pascalCase}}UsecaseReturnException - wait: $wait - start...');
  //     await Future.delayed(wait);
  //     // return const Left(ServerFailure(description: textSampleException));
  //     // return await Task(() => Future.value([]) as Future<List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>>)
  //     return await Task(() => Future.value([]))
  //       .attempt()
  //       .mapLeftToFailure()
  //       // .map((either) => either.map((data) => data as List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>))
  //       .run();
  // });
}

void arrange{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDeleteUsecaseReturnSuccess() {
  if (sl.isRegistered<Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase>()) {
    sl.unregister<Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase>();
  }
  sl.registerLazySingleton<Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase>(() => MockDelete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase());
  when(() => sl<Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase>()(any()))
      .thenAnswer((_) async => const Right(null));
}

void setUpHttpClientGet{{#pascalCase}}{{name_plural}}{{/pascalCase}}Success200({String url = url{{#pascalCase}}{{name_plural}}{{/pascalCase}}}) {
  arrangeHttpClientGetReturnSuccess200(url: url, response: fixture('{{#snakeCase}}{{name_plural}}{{/snakeCase}}_response_fixture.json'));
}


void setUpHttpClientCreate{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSuccess200({String url = url{{#pascalCase}}{{name_plural}}{{/pascalCase}}, {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model data = item{{#pascalCase}}{{name_plural}}{{/pascalCase}}AddTestData}) {
  arrangeHttpClientPostReturnSuccess200(url: url, response: fixture('{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_create_response_fixture.json'));
}

void setUpHttpClientUpdate{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSuccess204({String url = '$url{{#pascalCase}}{{name_plural}}{{/pascalCase}}/$sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId', {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model data = item{{#pascalCase}}{{name_plural}}{{/pascalCase}}AddTestData}) {
  arrangeHttpClientPutReturnSuccess204(url: url, response: '');
}

void setUpHttpClientDelete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSuccess204({String url = url{{#pascalCase}}{{name_plural}}{{/pascalCase}}, String id = sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemId}) {
  arrangeHttpClientDeleteReturnSuccess204(url: url, response: '');
}

extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<Failure, U>> mapLeftToFailure() {
    return map((either) => either.leftMap((obj) {
      try {
        return obj as Failure;
      } catch (e) {
        throw obj;
      }
    }));
  }

// Task<Either<Failure, U>> mapRightToList() {
//   return map((either) => either.Map((obj) {
//     try {
//       return obj as Failure;
//     } catch (e) {
//       throw obj;
//     }
//   }));
// }
}

/// Values must be different than the ones in sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState
const sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemInitialData = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
  id: '1',
  {{#fields}}{{#camelCase}}{{field_name}}{{/camelCase}}: '{{#camelCase}}{{field_name}}{{/camelCase}} 1',{{^is_last}}
  {{/is_last}}{{/fields}}
);

const sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStateObjectList = <Object?>[
  {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.initial,
  sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemInitialData,
  '',
  {{#fields}}'{{#camelCase}}{{field_name}}{{/camelCase}}',{{^is_last}}
  {{/is_last}}{{/fields}}
];

/// Values must be different than the ones in sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemInitialData
{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState sample{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState({
  {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus status = {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.initial,
  {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model? initialData
}) {
  return {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
    status: status,
    initialData: initialData,
    {{#fields}}{{#camelCase}}{{field_name}}{{/camelCase}}: '{{#camelCase}}{{field_name}}{{/camelCase}}',{{^is_last}}
    {{/is_last}}{{/fields}}
  );
}
