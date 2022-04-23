import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection_container.dart';
import '../../../../common/helper.dart';
import '../../../../common/itg_localization.dart';
import '../../data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import '../../domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import '../../domain/save_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_usecase.dart';
import '../main/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_bloc.dart';
import 'bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_bloc.dart';
import '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_view.dart';

enum ItemAddEditAction { add, edit, duplicate }

String titleFromAction({required String baseTitle, required ItemAddEditAction action}) {
  switch (action) {
    case ItemAddEditAction.add:
      return '${ItgLocalization.tr("New")} ${ItgLocalization.tr(baseTitle)}';
    case ItemAddEditAction.edit:
      return '${ItgLocalization.tr("Edit")} ${ItgLocalization.tr(baseTitle)}';
    case ItemAddEditAction.duplicate:
      return '${ItgLocalization.tr("Duplicate")} ${ItgLocalization.tr(baseTitle)}';
  }
}

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage extends StatelessWidget {
  static const routeName = '/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit';

  static Route<void> route({required ItemAddEditAction action, {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model? initialData, {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc? blocItems}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc(
              save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase: sl<Save{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase>(),
              initialData: initialData,
            ),
          ),
          if (blocItems != null)
            BlocProvider<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>.value(value: blocItems)
        ],
        child: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage(action: action),
      ),
    );
  }

  final ItemAddEditAction action;

  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage({Key? key, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String baseLogMsg = '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage.build]';
    final String title = titleFromAction(baseTitle: appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item, action: action);
    itgLogVerbose('$baseLogMsg action: $action, title: $title');
    return MultiBlocListener(
      listeners: [
        BlocListener<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState>(
          listenWhen: (previous, current) =>
            previous.status != current.status &&
            current.status == {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.success,
          listener: (context, state) {
            itgLogVerbose('[{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage/listener/success] Item saved...');
            showNotificationSuccess(context: context, msg: 'Item saved...');
            Navigator.of(context).pop();
          },
        ),
        BlocListener<{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditBloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditState>(
          listenWhen: (previous, current) => current.status == {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditStatus.failure,
          listener: (context, state) => showNotificationFailure(context: context, msg: 'Fail to save item!'),
        )
      ],
      child: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditView(title: title),
    );
  }
}
