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
  Future<Either<Failure, {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>> save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {{#camelCase}}{{name_plural}}{{/camelCase}}Item) async {
    msgBaseSourceMethod = 'save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item';
    msgLogInfo('{{#snakeCase}}{{name_singular}}{{/snakeCase}}: ${{#camelCase}}{{name_plural}}{{/camelCase}}Item');
    // return Right(await localDataSource.add{{#pascalCase}}{{name_singular}}{{/pascalCase}}({{#camelCase}}{{name_singular}}{{/camelCase}}));
    // return Right(await remoteDataSource.create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#camelCase}}{{name_singular}}{{/camelCase}}));
    if (await networkInfoIsConnected) {
      try {
        final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model ret;
        if ({{#camelCase}}{{name_plural}}{{/camelCase}}Item.id != null && {{#camelCase}}{{name_plural}}{{/camelCase}}Item.id!.isNotEmpty) {
          msgLogInfo('update item...');
          ret = await remoteDataSource.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#camelCase}}{{name_plural}}{{/camelCase}}Item);
        } else {
          msgLogInfo('create item...');
          ret = await remoteDataSource.create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#camelCase}}{{name_plural}}{{/camelCase}}Item);
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
          ({{#camelCase}}{{name_plural}}{{/camelCase}}) async {
            // if ({{#camelCase}}{{name_plural}}{{/camelCase}}Item.id == null) {
            //   // TODO: Why there is no setter in {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model?
            //   // There isn’t a setter named 'content' in class '_${{#pascalCase}}{{name_plural}}{{/pascalCase}}Mode
            //******** here there is the problem with mason {{{ *******************
            //   {{#camelCase}}{{name_plural}}{{/camelCase}}.add({{#camelCase}}{{name_plural}}{{/camelCase}}Item.copyWith(id: '${{{#snakeCase}}{{name_plural}}{{/snakeCase}}.length+1}'));
            // } else {
            //   {{#camelCase}}{{name_plural}}{{/camelCase}}.add({{#camelCase}}{{name_plural}}{{/camelCase}}Item);
            // }
            if ({{#camelCase}}{{name_plural}}{{/camelCase}}Item.id != null && {{#camelCase}}{{name_plural}}{{/camelCase}}Item.id!.isNotEmpty) {
              msgLogInfo('update item...');
              {{#camelCase}}{{name_plural}}{{/camelCase}}[{{#camelCase}}{{name_plural}}{{/camelCase}}.indexWhere((element) => element.id == {{#camelCase}}{{name_plural}}{{/camelCase}}Item.id)] = {{#camelCase}}{{name_plural}}{{/camelCase}}Item;
            } else {
              msgLogInfo('create item...');
              //******** here there is the problem with mason {{{ *******************
              {{#camelCase}}{{name_plural}}{{/camelCase}}.add({{#camelCase}}{{name_plural}}{{/camelCase}}Item.copyWith(id: '${{{#camelCase}}{{name_plural}}{{/camelCase}}.length+1}'));
            }
            await localDataSource.cache{{#pascalCase}}{{name_plural}}{{/pascalCase}}({{#camelCase}}{{name_plural}}{{/camelCase}});
          });
          return Right({{#camelCase}}{{name_plural}}{{/camelCase}}Item);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  // @override
  // Future<Either<Failure, {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>> edit{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {{#snakeCase}}{{name_singular}}{{/snakeCase}}) async {
  //   return Right(await localDataSource.edit{{#pascalCase}}{{name_singular}}{{/pascalCase}}({{#camelCase}}{{name_singular}}{{/camelCase}}));
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
          ({{#camelCase}}{{name_plural}}{{/camelCase}}) async {
            {{#camelCase}}{{name_plural}}{{/camelCase}}.removeWhere((element) => element.id == id);
            await localDataSource.cache{{#pascalCase}}{{name_plural}}{{/pascalCase}}({{#camelCase}}{{name_plural}}{{/camelCase}});
          });
        return const Right(null);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
