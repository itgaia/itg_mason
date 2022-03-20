part of '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart';

abstract class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent extends Equatable {
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent();

  @override
  List<Object> get props => [];
}

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent extends {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent {
  final String description;

  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent(this.description);

  @override
  List<Object> get props => [description];
}

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditContentChangedEvent extends {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent {
  final String content;

  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditContentChangedEvent(this.content);

  @override
  List<Object> get props => [content];
}

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent extends {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent {
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent();
}
