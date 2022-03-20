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
    this.description = '',
    this.content = '',
  });

  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus status;
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model? initialData;
  final String id;
  final String description;
  final String content;

  bool get isNew => initialData == null;

  {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState copyWith({
    {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus? status,
    {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model? initialData,
    String? id,
    String? description,
    String? content,
  }) {
    return {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
      status: status ?? this.status,
      initialData: initialData ?? this.initialData,
      id: id ?? this.id,
      description: description ?? this.description,
      content: content ?? this.content,
    );
  }

  @override
  List<Object?> get props => [status, initialData, id, description, content];
}
