import 'package:dartz/dartz.dart';

import '../../../common/helper.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_repository.dart';

class Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase implements UseCase<List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>, NoParams> {
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Repository repository;

  Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase(this.repository);

  @override
  Future<Either<Failure, List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>>> call(NoParams params) async {
    itgLogVerbose('[Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase] call...');
    return repository.get{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
  }
}
