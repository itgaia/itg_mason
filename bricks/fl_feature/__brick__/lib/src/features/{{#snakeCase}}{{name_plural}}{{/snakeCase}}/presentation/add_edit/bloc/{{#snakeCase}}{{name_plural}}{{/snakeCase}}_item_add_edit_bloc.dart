import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import '../../../../../common/helper.dart';
import '../../../data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import '../../../domain/save_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_usecase.dart';

part '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_event.dart';
part '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_state.dart';

const msgBaseSourceClass = '{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc';
String msgBaseSourceMethod = '';
void msgLogInfo(String msg) => itgLogVerbose('[$msgBaseSourceClass/$msgBaseSourceMethod] $msg');

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc extends Bloc<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditEvent, {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState> {
  final Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase _save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase;

  {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc({
    required Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase,
    required {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model? initialData
  })  : _save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase = save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase,
        super(
          {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState(
            initialData: initialData,
            {{#fields}}{{#camelCase}}{{field_name}}{{/camelCase}}: initialData?.{{#camelCase}}{{field_name}}{{/camelCase}} ?? '',{{^is_last}}
            {{/is_last}}{{/fields}}
      )) {
    {{#fields}}on<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEdit{{#pascalCase}}{{field_name}}{{/pascalCase}}ChangedEvent>(_on{{#pascalCase}}{{field_name}}{{/pascalCase}}Changed);{{^is_last}}
    {{/is_last}}{{/fields}}
    on<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent>(_onSubmitted);
  }

  //** fields start **//
  {{#fields}}void _on{{#pascalCase}}{{field_name}}{{/pascalCase}}Changed(
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEdit{{#pascalCase}}{{field_name}}{{/pascalCase}}ChangedEvent event,
      Emitter<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState> emit,
  ) {
    emit(state.copyWith({{#camelCase}}{{field_name}}{{/camelCase}}: event.{{#camelCase}}{{field_name}}{{/camelCase}}));
  }{{^is_last}}

  {{/is_last}}{{/fields}}
  //** fields end **//

  Future<void> _onSubmitted(
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent event,
      Emitter<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState> emit,
      ) async {
    msgBaseSourceMethod = '_onSubmitted';
    msgLogInfo('start...');
    emit(state.copyWith(status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.submitting));
    msgLogInfo('emitted submitting state...');
    final {{#snakeCase}}{{name_plural}}{{/snakeCase}}Item = (state.initialData ?? const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model({{#fields}}{{#required}}{{#camelCase}}{{field_name}}{{/camelCase}}: {{empty_value}}{{^is_last_required}}, {{/is_last_required}}{{/required}}{{/fields}})).copyWith(
      {{#fields}}{{#camelCase}}{{field_name}}{{/camelCase}}: state.{{#camelCase}}{{field_name}}{{/camelCase}},{{^is_last}}
      {{/is_last}}{{/fields}}
    );

    msgLogInfo('call _save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase...');
    final failureOrSuccess = await _save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase({{#snakeCase}}{{name_plural}}{{/snakeCase}}Item);
    msgLogInfo('failureOrSuccess: $failureOrSuccess');
    emit(
      failureOrSuccess.fold(
        (failure) => state.copyWith(status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.failure),
        ({{#snakeCase}}{{name_plural}}{{/snakeCase}}Item) => state.copyWith(status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.success)
      )
    );
  }
}