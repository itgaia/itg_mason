import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import '../../../../../app/injection_container.dart';
import '../../../../../common/helper.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import '../../../domain/delete_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_usecase.dart';
import '../../../domain/get_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_usecase.dart';
import '../../../domain/save_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_usecase.dart';
import '../{{#snakeCase}}{{name_plural}}{{/snakeCase}}_list_filter.dart';

part '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_event.dart';
part '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_state.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';
const String invalidInputFailureMessage =
    'Invalid Input - The number must be a positive integer or zero.';

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc extends Bloc<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Event, {{#pascalCase}}{{name_plural}}{{/pascalCase}}State> {
  {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc({
    // required Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase usecase,
    required this.usecase,
  })  : //_get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase = usecase,
        super(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}State()) {
    itgLogVerbose('[{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc constructor] usecase: $usecase');
    on<{{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent>(_on{{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent);
    on<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSavedEvent>(_on{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSavedEvent);
    on<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDeletedEvent>(_on{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDeletedEvent);
    on<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUndoDeletionRequestedEvent>(_on{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUndoDeletionRequestedEvent);
    on<{{#pascalCase}}{{name_plural}}{{/pascalCase}}FilterChangedEvent>(_on{{#pascalCase}}{{name_plural}}{{/pascalCase}}FilterChangedEvent);
  }

  // final Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase _get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase;
  final Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase usecase;

  // TODO: If there is no problem in get them from the sl, use it also in getXXX
  final Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase _saveItemUsecase = sl<Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase>();
  final Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase _deleteItemUsecase = sl<Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase>();

  Future<void> _on{{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent(
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent event,
      Emitter<{{#pascalCase}}{{name_plural}}{{/pascalCase}}State> emit,
      // ) async* {
      ) async {
    const String baseLogMsg = '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc._on{{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent]';
    itgLogVerbose('$baseLogMsg loading...');
    emit(state.copyWith(status: () => {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.loading));

    itgLogVerbose('$baseLogMsg call usecase: $usecase');
    final failureOrSuccess = await usecase(NoParams());

    emit(failureOrSuccess.fold(
      (failure) => state.copyWith(status: () => {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.failure),
          // TODO: where to pass the error msg? Error(message: failure.toString()),
      (items) => state.copyWith(
        status: () => {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.success,
        items: () => items
      )));
    itgLogVerbose('$baseLogMsg status emitted!');
  }

  Future<void> _on{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSavedEvent (
    {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemSavedEvent event, Emitter<{{#pascalCase}}{{name_plural}}{{/pascalCase}}State> emit) async {
    await _saveItemUsecase(event.item);
  }

  Future<void> _on{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDeletedEvent (
    {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDeletedEvent event, Emitter<{{#pascalCase}}{{name_plural}}{{/pascalCase}}State> emit) async {
    emit(state.copyWith(lastDeletedItem: () => event.item));
    await _deleteItemUsecase(event.item.id!);
  }

  Future<void> _on{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUndoDeletionRequestedEvent (
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUndoDeletionRequestedEvent event,
      Emitter<{{#pascalCase}}{{name_plural}}{{/pascalCase}}State> emit,
      ) async {
    assert(state.lastDeletedItem != null, 'Last deleted ITEM can not be null.');

    final item = state.lastDeletedItem!;
    emit(state.copyWith(lastDeletedItem: () => null));
    await _saveItemUsecase(item);
  }

  Future<void> _on{{#pascalCase}}{{name_plural}}{{/pascalCase}}FilterChangedEvent (
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}FilterChangedEvent event,
      Emitter<{{#pascalCase}}{{name_plural}}{{/pascalCase}}State> emit,
      ) async {
    emit(state.copyWith(filter: () => event.filter));
  }
}

