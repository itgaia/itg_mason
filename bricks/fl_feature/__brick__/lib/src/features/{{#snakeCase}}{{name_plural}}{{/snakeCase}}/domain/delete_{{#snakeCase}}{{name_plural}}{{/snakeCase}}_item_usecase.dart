import 'package:dartz/dartz.dart';

import '../../../common/helper.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_repository.dart';

class Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase implements UseCase<void, String> {
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Repository repository;

  Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(String id) async {
    itgLogVerbose('Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase - call - id: $id');
    return repository.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(id);
  }
}
