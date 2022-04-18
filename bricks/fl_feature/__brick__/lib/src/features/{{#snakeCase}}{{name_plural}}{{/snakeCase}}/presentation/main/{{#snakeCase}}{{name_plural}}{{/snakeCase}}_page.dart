import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/constants.dart';
import '../../../../app/injection_container.dart';
import '../../../../common/helper.dart';
import '../../../../common/itg_localization.dart';
import '../../domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import '../../domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_support.dart';
import 'bloc/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_bloc.dart';
import '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_list_item.dart';

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}Page extends StatelessWidget {
  static const routeName = '/{{#snakeCase}}{{name_plural}}{{/snakeCase}}';

  static Route<void> route() {
    return MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Page()
    );
  }

  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String baseLogMsg = '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page]';
    itgLogVerbose('$baseLogMsg build...');
    // TODO: Do we need it? We already have dependency injection...
    // How can I BlocListeners can work with sl<>?
    return BlocProvider(
      // create: (_) => {{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc({{#pascalCase}}{{name_plural}}{{/pascalCase}}: Get{{#pascalCase}}{{name_plural}}{{/pascalCase}}Usecase())
      create: (context) => sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>()
        ..add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}SubscriptionRequestedEvent()),
      child: const {{#pascalCase}}{{name_plural}}{{/pascalCase}}View(),
    );
  }
}

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}View extends StatelessWidget {
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String baseLogMsg = '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}View]';
    itgLogVerbose('$baseLogMsg build...');
    return Scaffold(
      appBar: AppBar(
        title: Text(ItgLocalization.tr('{{#pascalCase}}{{name_plural}}{{/pascalCase}}'), key: keyTextPageTitle),
        actions: const [
          // TodosOverviewFilterButton(),
          // TodosOverviewOptionsButton(),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}State>(
            listener: (context, state) {
              itgLogVerbose('$baseLogMsg BlocListener (all) - state.status: ${state.status}');
            }
          ),
          BlocListener<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}State>(
            listenWhen: (previous, current) => previous.status != current.status,
            listener: (context, state) {
              itgLogVerbose('$baseLogMsg BlocListener (status changed) - state.status: ${state.status}');
              if (state.status == {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.failure) {
                itgLogError('$baseLogMsg  failure: ${textMessageToDisplayError(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}', errorMessage: '')}');
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(
                        textMessageToDisplayError(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}', errorMessage: ''),
                        key: keyTextError
                      ),
                    ),
                  );
              }
            },
          ),
          BlocListener<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}State>(
            listenWhen: (previous, current) =>
              previous.lastDeletedItem != current.lastDeletedItem &&
              current.lastDeletedItem != null,
            listener: (context, state) {
              final deletedItem = state.lastDeletedItem!;
              final messenger = ScaffoldMessenger.of(context);
              messenger
                ..hideCurrentSnackBar()
                ..showSnackBar(
                    SnackBar(
                      content: Text(textMessageToDisplayDeleteItem(
                        dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}',
                        itemTitle: deletedItem.title
                      )),
                      action: SnackBarAction(
                        label: textButtonSnackbarDeleteUndo,
                        onPressed: () {
                          messenger.hideCurrentSnackBar();
                          context
                              .read<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc>()
                              .add(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemUndoDeletionRequestedEvent());
                        },
                      ),
                    ),
                );
            },
          ),
        ],
        child: BlocBuilder<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Bloc, {{#pascalCase}}{{name_plural}}{{/pascalCase}}State>(
          builder: (context, state) {
            itgLogVerbose('$baseLogMsg BlocBuilder start - state.status: ${state.status}');
            if (state.items.isEmpty) {
              itgLogVerbose('$baseLogMsg items is empty...');
              if (state.status == {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.loading) {
                return const Center(child: CupertinoActivityIndicator(key: keyProgressIndicatorMain));
              } else if (state.status != {{#pascalCase}}{{name_plural}}{{/pascalCase}}Status.success) {
                return const SizedBox();
              } else {
                itgLogVerbose('$baseLogMsg show text that items is Empty...');
                return Center(
                  child: Text(
                    textMessageToDisplayNoData(dataModelName: '{{#pascalCase}}{{name_plural}}{{/pascalCase}}'),
                    style: Theme.of(context).textTheme.caption,
                  ),
                );
              }
            }

            itgLogVerbose('$baseLogMsg render items in ListView...');
            itgLogVerbose('$baseLogMsg state.items.last: ${state.items.last}...');
            return CupertinoScrollbar(
              child: ListView(
                children: [
                  for (final item in state.filteredItems)
                    {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListItem(item: item)
                ],
                key: keyItemsListWidget,
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ...sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>().getFloatingActionsListForItems(context: context, baseKeyName: key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase)
        ],
        key: const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-floating-actions'),
      ),
      key: keyItemsPage
    );
  }
}
