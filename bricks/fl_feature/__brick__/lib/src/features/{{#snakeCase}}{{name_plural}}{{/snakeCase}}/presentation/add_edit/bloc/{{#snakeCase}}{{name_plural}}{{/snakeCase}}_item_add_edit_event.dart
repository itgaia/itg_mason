part of '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart';

abstract class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent extends Equatable {
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent();

  @override
  List<Object> get props => [];
}

//** fields start **//
{{#fields}}class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEdit{{#pascalCase}}{{field_name}}{{/pascalCase}}ChangedEvent extends {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent {
  final String {{#camelCase}}{{field_name}}{{/camelCase}};

  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEdit{{#pascalCase}}{{field_name}}{{/pascalCase}}ChangedEvent(this.{{#camelCase}}{{field_name}}{{/camelCase}});

  @override
  List<Object> get props => [{{#camelCase}}{{field_name}}{{/camelCase}}];
}{{^is_last}}

{{/is_last}}{{/fields}}
//** fields end **//

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent extends {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent {
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent();
}
