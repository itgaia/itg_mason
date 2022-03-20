part of '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_bloc.dart';

enum {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status { initial, loading, success, failure }

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}State extends Equatable {
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State({
    this.status = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.initial,
    this.items = const [],
    this.filter = {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter.all,
    this.lastDeletedItem
  });

  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status status;
  final List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> items;
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter filter;
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model? lastDeletedItem;

  Iterable<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> get filteredItems => filter.applyAll(items);

  {{#pascalCase}}{{name_plural}}{{/pascalCase}}State copyWith({
    {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status Function()? status,
    List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> Function()? items,
    {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter Function()? filter,
    {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model? Function()? lastDeletedItem,
  }) {
    return {{#pascalCase}}{{name_plural}}{{/pascalCase}}State(
      status: status != null ? status() : this.status,
      items: items != null ? items() : this.items,
      filter: filter != null ? filter() : this.filter,
      lastDeletedItem: lastDeletedItem != null ? lastDeletedItem() : this.lastDeletedItem,
    );
  }

  @override
  List<Object?> get props => [
    status,
    items,
    filter,
    lastDeletedItem,
  ];
}
