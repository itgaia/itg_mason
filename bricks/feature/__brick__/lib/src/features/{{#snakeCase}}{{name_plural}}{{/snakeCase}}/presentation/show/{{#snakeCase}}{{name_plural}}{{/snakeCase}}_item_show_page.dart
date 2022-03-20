import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/constants.dart';
import '../../../../app/injection_container.dart';
import '../../../../common/helper.dart';
import '../../data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import '../../domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import '../../domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_support.dart';
import '../main/bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_bloc.dart';
import '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_screen.dart';

const msgBaseSourceClass = '{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage';
String msgBaseSourceMethod = '';
void msgLogInfo(String msg) => itgLogVerbose('[$msgBaseSourceClass/$msgBaseSourceMethod] $msg');
void msgLogPrint(String msg) => itgLogPrint('[$msgBaseSourceClass/$msgBaseSourceMethod] $msg');

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage extends StatelessWidget {
  static const routeName = '/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item';

  static Route<void> route({required {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model data, required String title, {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc? blocItems}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => blocItems == null
        ? {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage(title: title, item: data)
        : BlocProvider<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>.value(
            value: blocItems,
            child: BlocListener<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}State>(
              listenWhen: (previous, current) =>
              previous.status != current.status &&
                  current.status == {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.success,
              listener: (context, state) {
                msgBaseSourceMethod = '{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc changed';
                msgLogInfo('data: $data');

                try {
                  final newData = state.items.firstWhere((element) => element.id == data.id);
                  msgLogInfo('newData: $newData');
                  sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>().actionItemRefresh(context: context, data: newData);
                } on StateError {
                  itgLogError('[{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage.Route] on items state change - Did not find item with id: ${data.id}');
                }
                // showNotificationSuccess(context: context, msg: 'Items changed...');
                // Navigator.of(context).pop();
              },
              child: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage(title: title, item: data)
            ),
          )
    );
  }

  final String title;
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model item;

  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemShowPage({required this.title, required this.item, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    msgBaseSourceMethod = 'build';
    msgLogInfo('title: $title');
    return Scaffold(
        appBar: AppBar(title: Text(title, key: keyTextPageTitle)),
        body: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemScreen(data: item),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ...sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>().getFloatingActionsListForItem(data: item, context: context, baseKeyName: key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase)
          ],
          key: const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-floating-actions'),
        ),
        key: keyItemsItemShowPage
    );
  }

}