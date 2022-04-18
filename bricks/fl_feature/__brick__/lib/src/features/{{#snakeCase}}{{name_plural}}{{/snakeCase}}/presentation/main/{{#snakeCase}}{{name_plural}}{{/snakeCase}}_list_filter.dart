import '../../../../common/helper.dart';
import '../../data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';

enum {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter { all, latest }

extension {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilterX on {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter {
  bool apply({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model item) {
    switch (this) {
      case {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.all:
        return true;
      case {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.latest:
        final DateTime dtUpdatedAt = jsonStringAsValue(item.updatedAt, valueType: 'date');
        final DateTime dtMin = DateTime.now().subtract(const Duration(days: 30+1));
        return dtUpdatedAt.isAfter(dtMin);
    }
  }

  Iterable<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> applyAll(Iterable<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> items) {
    return items.where(apply);
  }
}