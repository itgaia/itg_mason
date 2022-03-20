import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';

abstract class {{#pascalCase}}{{name_plural}}{{/pascalCase}}Repository {
  Future<Either<Failure, List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>>> get{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
  Future<Either<Failure, List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>>> search{{#pascalCase}}{{name_plural}}{{/pascalCase}}(String query);
  Future<Either<Failure, {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>> save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {{#snakeCase}}{{name_plural}}{{/snakeCase}}Item);
  Future<Either<Failure, void>> delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(String id);
}
