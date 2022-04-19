import 'package:dartz/dartz.dart';

import '../../../common/helper.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_repository.dart';

class Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase implements UseCase<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model, {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> {
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Repository repository;

  Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase(this.repository);

  @override
  Future<Either<Failure, {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>> call({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {{#camelCase}}{{name_singular}}{{/camelCase}}) async {
    itgLogVerbose('Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase - call...');
    return repository.save{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#camelCase}}{{name_singular}}{{/camelCase}});
  }
}
