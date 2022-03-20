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
            description: initialData?.description ?? '',
            content: initialData?.content ?? '',
      )) {
    on<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent>(_onDescriptionChanged);
    on<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditContentChangedEvent>(_onContentChanged);
    on<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent>(_onSubmitted);
  }

  void _onDescriptionChanged(
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditDescriptionChangedEvent event,
      Emitter<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState> emit,
  ) {
    msgBaseSourceMethod = '_onDescriptionChanged';
    msgLogInfo('event.description: ${event.description}');
    emit(state.copyWith(description: event.description));
  }

  void _onContentChanged(
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditContentChangedEvent event,
      Emitter<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState> emit,
  ) {
    emit(state.copyWith(content: event.content));
  }

  Future<void> _onSubmitted(
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditSubmittedEvent event,
      Emitter<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState> emit,
      ) async {
    msgBaseSourceMethod = '_onSubmitted';
    msgLogInfo('start...');
    emit(state.copyWith(status: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.submitting));
    msgLogInfo('emitted submitting state...');
    final {{#snakeCase}}{{name_plural}}{{/snakeCase}}Item = (state.initialData ?? const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(description: '')).copyWith(
      description: state.description,
      content: state.content,
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