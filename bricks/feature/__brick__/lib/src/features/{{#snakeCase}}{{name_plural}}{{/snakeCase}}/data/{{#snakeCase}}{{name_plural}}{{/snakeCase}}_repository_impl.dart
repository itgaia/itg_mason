import 'package:dartz/dartz.dart';

import '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_local_datasource.dart';
import '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_remote_datasource.dart';
import '../../../app/constants.dart';
import '../../../common/helper.dart';
import '../../../core/error/exception.dart';
import '../../../core/error/failures.dart';
import '../domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_repository.dart';

const msgBaseSourceClass = '{{#pascalCase}}{{name_plural}}{{/pascalCase}}RepositoryImpl';
String msgBaseSourceMethod = '';
void msgLogInfo(String msg) => itgLogVerbose('[$msgBaseSourceClass/$msgBaseSourceMethod] $msg');
void msgLogError(String msg) => itgLogError('[$msgBaseSourceClass/$msgBaseSourceMethod] $msg');

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}RepositoryImpl implements {{#pascalCase}}{{name_plural}}{{/pascalCase}}Repository {
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSource remoteDataSource;
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}LocalDataSource localDataSource;
  // final NetworkInfo networkInfo;

  {{#pascalCase}}{{name_plural}}{{/pascalCase}}RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    // required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>>> get{{#pascalCase}}{{name_plural}}{{/pascalCase}}() async {
    msgBaseSourceMethod = 'get{{#pascalCase}}{{name_plural}}{{/pascalCase}}';
    msgLogInfo('start....');
    if (await networkInfoIsConnected) {
      try {
        msgLogInfo('Network is up....');
        final List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> remote{{#pascalCase}}{{name_plural}}{{/pascalCase}} = await remoteDataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
        localDataSource.cache{{#pascalCase}}{{name_plural}}{{/pascalCase}}(remote{{#pascalCase}}{{name_plural}}{{/pascalCase}});
        return Right(remote{{#pascalCase}}{{name_plural}}{{/pascalCase}});
      } on ServerException catch (e) {
        return Left(ServerFailure(code: e.code, description: e.description));
      }
    } else {
      try {
        msgLogInfo('Network is down....');
        final local{{#pascalCase}}{{name_plural}}{{/pascalCase}} = await localDataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
        return Right(local{{#pascalCase}}{{name_plural}}{{/pascalCase}});
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>>> search{{#pascalCase}}{{name_plural}}{{/pascalCase}}(String query) async {
    const String baseLogMsg = '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}RepositoryImpl.search{{#pascalCase}}{{name_plural}}{{/pascalCase}}]';
    itgLogVerbose('$baseLogMsg query: $query');
    final networkList = await remoteDataSource.search{{#pascalCase}}{{name_plural}}{{/pascalCase}}(query);
    // final localList = await localDataSource.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}(query);
    // return Right(List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Entity>.empty(growable: true)
    //   ..addAll(networkList)
    //   ..addAll(localList));
    return Right(networkList);
  }

  @override
  Future<Either<Failure, {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>> save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {{#snakeCase}}{{name_plural}}{{/snakeCase}}Item) async {
    msgBaseSourceMethod = 'save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item';
    msgLogInfo('{{#snakeCase}}{{name_singular}}{{/snakeCase}}: ${{#snakeCase}}{{name_plural}}{{/snakeCase}}Item');
    // return Right(await localDataSource.add{{#pascalCase}}{{name_singular}}{{/pascalCase}}({{#snakeCase}}{{name_singular}}{{/snakeCase}}));
    // return Right(await remoteDataSource.create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#snakeCase}}{{name_singular}}{{/snakeCase}}));
    if (await networkInfoIsConnected) {
      try {
        final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model ret;
        if ({{#snakeCase}}{{name_plural}}{{/snakeCase}}Item.id != null && {{#snakeCase}}{{name_plural}}{{/snakeCase}}Item.id!.isNotEmpty) {
          msgLogInfo('update item...');
          ret = await remoteDataSource.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#snakeCase}}{{name_plural}}{{/snakeCase}}Item);
        } else {
          msgLogInfo('create item...');
          ret = await remoteDataSource.create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#snakeCase}}{{name_plural}}{{/snakeCase}}Item);
        }
        return Right(ret);
        // return Future.value(Right(ret));
      } on ServerException catch (e) {
        return Left(ServerFailure(code: e.code, description: e.description));
      }
    } else {
      msgLogError('network is down...');
      try {
        final failureOrSuccess = await get{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
        failureOrSuccess.fold(
          (l) => null,
          ({{#snakeCase}}{{name_plural}}{{/snakeCase}}) async {
            // if ({{#snakeCase}}{{name_plural}}{{/snakeCase}}Item.id == null) {
            //   // TODO: Why there is no setter in {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model?
            //   // There isn’t a setter named 'content' in class '_${{#pascalCase}}{{name_plural}}{{/pascalCase}}Mode
            //   {{#snakeCase}}{{name_plural}}{{/snakeCase}}.add({{#snakeCase}}{{name_plural}}{{/snakeCase}}Item.copyWith(id: '${{{#snakeCase}}{{name_plural}}{{/snakeCase}}.length+1}'));
            // } else {
            //   {{#snakeCase}}{{name_plural}}{{/snakeCase}}.add({{#snakeCase}}{{name_plural}}{{/snakeCase}}Item);
            // }
            if ({{#snakeCase}}{{name_plural}}{{/snakeCase}}Item.id != null && {{#snakeCase}}{{name_plural}}{{/snakeCase}}Item.id!.isNotEmpty) {
              msgLogInfo('update item...');
              {{#snakeCase}}{{name_plural}}{{/snakeCase}}[{{#snakeCase}}{{name_plural}}{{/snakeCase}}.indexWhere((element) => element.id == {{#snakeCase}}{{name_plural}}{{/snakeCase}}Item.id)] = {{#snakeCase}}{{name_plural}}{{/snakeCase}}Item;
            } else {
              msgLogInfo('create item...');
              {{#snakeCase}}{{name_plural}}{{/snakeCase}}.add({{#snakeCase}}{{name_plural}}{{/snakeCase}}Item.copyWith(id: '${{{#snakeCase}}{{name_plural}}{{/snakeCase}}.length+1}'));
            }
            await localDataSource.cache{{#pascalCase}}{{name_plural}}{{/pascalCase}}({{#snakeCase}}{{name_plural}}{{/snakeCase}});
          });
          return Right({{#snakeCase}}{{name_plural}}{{/snakeCase}}Item);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  // @override
  // Future<Either<Failure, {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>> edit{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {{#snakeCase}}{{name_singular}}{{/snakeCase}}) async {
  //   return Right(await localDataSource.edit{{#pascalCase}}{{name_singular}}{{/pascalCase}}({{#snakeCase}}{{name_singular}}{{/snakeCase}}));
  // }

  @override
  Future<Either<Failure, void>> delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(String id) async {
    msgBaseSourceMethod = 'delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item';
    msgLogInfo('id: $id');
    if (await networkInfoIsConnected) {
      try {
        msgLogInfo('delete item...');
        await remoteDataSource.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(id);
        return const Right(null);
      } on ServerException catch (e) {
        return Left(ServerFailure(code: e.code, description: e.description));
      }
    } else {
      msgLogError('network is down...');
      try {
        final failureOrSuccess = await get{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
        failureOrSuccess.fold(
          (l) => null,
          ({{#snakeCase}}{{name_plural}}{{/snakeCase}}) async {
            {{#snakeCase}}{{name_plural}}{{/snakeCase}}.removeWhere((element) => element.id == id);
            await localDataSource.cache{{#pascalCase}}{{name_plural}}{{/pascalCase}}({{#snakeCase}}{{name_plural}}{{/snakeCase}});
          });
        return const Right(null);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
