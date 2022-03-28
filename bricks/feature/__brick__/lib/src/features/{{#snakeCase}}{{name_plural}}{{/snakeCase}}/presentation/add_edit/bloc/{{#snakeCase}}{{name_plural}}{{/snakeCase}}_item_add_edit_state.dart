part of '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart';

enum {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus { initial, submitting, success, failure }

extension {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatusX on {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus {
  bool get isSubmittingOrSuccess => [
    {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.submitting,
    {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.success,
  ].contains(this);
}

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState extends Equatable {
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState({
    this.status = {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.initial,
    this.initialData,
    this.id = '',
    {{#fields}}this.{{#camelCase}}{{field_name}}{{/camelCase}} = {{empty_value}},{{^is_last}}
    {{/is_last}}{{/fields}}
  });

  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus status;
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model? initialData;
  final String id;
  {{#fields}}final String {{#camelCase}}{{field_name}}{{/camelCase}};{{^is_last}}
  {{/is_last}}{{/fields}}

  bool get isNew => initialData == null;

  {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState copyWith({
    {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus? status,
    {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model? initialData,
    String? id,
    {{#fields}}String? {{#camelCase}}{{field_name}}{{/camelCase}},{{^is_last}}
    {{/is_last}}{{/fields}}
  }) {
    return {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
      status: status ?? this.status,
      initialData: initialData ?? this.initialData,
      id: id ?? this.id,
      {{#fields}}{{#camelCase}}{{field_name}}{{/camelCase}}: {{#camelCase}}{{field_name}}{{/camelCase}} ?? this.{{#camelCase}}{{field_name}}{{/camelCase}},{{^is_last}}
      {{/is_last}}{{/fields}}
    );
  }

  @override
  List<Object?> get props => [status, initialData, id{{#fields}}, {{#camelCase}}{{field_name}}{{/camelCase}}{{/fields}}];
}
