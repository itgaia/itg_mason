
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/constants.dart';
import '../../../app/injection_container.dart';
import '../../../common/helper.dart';
import '../../../common/itg_localization.dart';
import '../../../core/support/support_base.dart';
import '../presentation/add_edit/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_add_edit_page.dart';
import '../presentation/main/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_bloc.dart';
import '../presentation/show/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_show_page.dart';
import 'delete_{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_usecase.dart';

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}Support extends SupportBase {
  @override
  String get titleSingular => '{{#titleCase}}{{name_singular}}{{/titleCase}}';
  @override
  String get titlePlural => '{{#titleCase}}{{name_plural}}{{/titleCase}}';
  @override
  bool get allowRefresh => true;
  @override
  bool get allowEdit => true;
  @override
  bool get allowDuplicate => true;
  @override
  bool get allowAdd => true;
  @override
  bool get allowDelete => true;

  @override
  Future<dynamic> actionItemShow({required BuildContext context, required dynamic data}) async {
    itgLogVerbose('[{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support.actionItemShow] ...');
    final ret = await Navigator.push(
        context,
        {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage.route(title: ItgLocalization.tr('{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item'), data: data,
          blocItems: context.read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>())
    );
    return ret;
  }

  @override
  Future<dynamic> actionItemEdit({required BuildContext context, required dynamic data}) async {
    const String baseLogMsg = '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support.actionItemEdit]';
    itgLogVerbose('$baseLogMsg ...');
    // final ret = await Navigator.of(context).push({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage.route(action: ItemAddEditAction.edit, initialData: data));
    final ret = await Navigator.push(
      context,
      {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage.route(action: ItemAddEditAction.edit, initialData: data)
    );
    itgLogVerbose('$baseLogMsg context: $context');
    context.read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>().add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent());
    // // final bloc = context.read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>();
    // final bloc = BlocProvider.of<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>(context);
    // itgLogVerbose('>>> bloc: $bloc');
    // if (bloc is {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc) {
    //   itgLogVerbose('>>> before add event in bloc...');
    //   bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent());
    // } else {
    //   itgLogError('$baseLogMsg Error: it was not possible to find the bloc in the context: $context');
    // }

    // TODO: Why it is not the same if I use the sl<>()?
    // itgLogVerbose('>>> BlocProvider.of: ${BlocProvider.of<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>(context)}');
    // final bloc = context.read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>();
    // itgLogVerbose('>>> bloc: $bloc');
    // if (bloc is {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc) {
    //   bloc.add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent());
    // } else {
    //   itgLogError('$baseLogMsg Error: it was not possible to find the bloc in the context: $context');
    // }
    // itgLogVerbose('>>> context.read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>(): ${context.read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>()}\n====================');
    // itgLogVerbose('>>> sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>(): ${sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>()}\n====================');
    // itgLogVerbose('>>> check equal: ${sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>() == context.read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>()}');
    // // sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>().add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent());
    // itgLogVerbose('$baseLogMsg result: $ret');
    return ret;
  }

  @override
  Future<dynamic> actionItemDuplicate({required BuildContext context, required data}) async {
    itgLogVerbose('[{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support.actionItemDuplicate] ...');
    final ret = await Navigator.of(context).push({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage.route(action: ItemAddEditAction.duplicate, initialData: data.copyWith(id: null, {{test_field_1}}: '${data.{{test_field_1}}}$textTitleSuffixDuplicate')));
    context.read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>().add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent());
    // sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>().add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent());
    return ret;
  }

  @override
  Future<dynamic> actionItemAdd({required BuildContext context, dynamic data}) async {
    itgLogVerbose('[{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support.actionItemAdd] ...');
    final ret =  await Navigator.of(context).push({{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddEditPage.route(action: ItemAddEditAction.add));
    itgLogVerbose('[{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support.actionItemAdd] return from AddEditPage. Submit a {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent...');
    context.read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>().add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent());
    // sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>().add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent());
    return ret;
  }

  @override
  Future<dynamic> actionItemDelete({required BuildContext context, required data}) async {
    const String baseLogMsg = '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support.actionItemDelete]';
    itgLogVerbose('$baseLogMsg start...');
    if (await confirm(
        context,
        title: Text('${ItgLocalization.tr("Confirm")} - ${ItgLocalization.tr("Delete")} ${ItgLocalization.tr(titleSingular)}'),
        content: Text(ItgLocalization.tr('Are you sure?'))
    )) {
      // final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Api api = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Api();
      // await api.delete{{#pascalCase}}{{name_singular}}{{/pascalCase}}(current.id);
      // refresh<{{#snakeCase}}{{name_singular}}{{/snakeCase}}, {{#pascalCase}}{{name_singular}}{{/pascalCase}}Manager>(context: context, notification: false);

      final failureOrSuccess = await sl<Delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUsecase>().call(data.id);
      itgLogVerbose('$baseLogMsg after usecase call - failureOrSuccess: $failureOrSuccess');
      failureOrSuccess.fold(
        (failure) =>
          showNotificationFailure(
            context: context,
            msg: "Error '$failure' when try to delete ${ItgLocalization.tr(titleSingular)}!"
          ),
        (_) {
          itgLogPrint('$baseLogMsg Item deleted...');
          showNotificationSuccess(
              context: context,
              msg: "${ItgLocalization.tr(titleSingular)} ${ItgLocalization.tr('has been deleted')}"
          );
          context.read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>().add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent());
          if (context.widget is {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage) Navigator.of(context).pop();
        }
      );
    }
  }

  @override
  Future<dynamic> actionItemRefresh({required BuildContext context, required dynamic data}) async {
    itgLogVerbose('[{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support.actionItemRefresh] ...');
    Navigator.of(context).pop();
    // await actionItemsRefresh(context: context);
    actionItemShow(context: context, data: data);
  }

  @override
  Future<dynamic> actionItemsRefresh({required BuildContext context}) async {
    itgLogVerbose('[{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support.actionItemsRefresh] ...');
    // sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>().add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent());
    context
        .read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>()
        .add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent());
  }
}