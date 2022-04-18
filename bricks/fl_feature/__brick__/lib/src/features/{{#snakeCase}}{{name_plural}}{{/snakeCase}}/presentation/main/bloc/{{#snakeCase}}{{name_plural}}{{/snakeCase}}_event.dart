part of '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_bloc.dart';

abstract class {{#pascalCase}}{{name_plural}}{{/pascalCase}}Event extends Equatable {
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Event();

  @override
  List<Object> get props => [];
}

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent extends {{#pascalCase}}{{name_plural}}{{/pascalCase}}Event {
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent();
}

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSavedEvent extends {{#pascalCase}}{{name_plural}}{{/pascalCase}}Event {
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSavedEvent(this.item);

  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model item;

  @override
  List<Object> get props => [item];
}

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDeletedEvent extends {{#pascalCase}}{{name_plural}}{{/pascalCase}}Event {
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDeletedEvent(this.item);

  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model item;

  @override
  List<Object> get props => [item];
}

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUndoDeletionRequestedEvent extends {{#pascalCase}}{{name_plural}}{{/pascalCase}}Event {
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUndoDeletionRequestedEvent();
}

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}FilterChangedEvent extends {{#pascalCase}}{{name_plural}}{{/pascalCase}}Event {
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}FilterChangedEvent(this.filter);

  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListFilter filter;

  @override
  List<Object> get props => [filter];
}
