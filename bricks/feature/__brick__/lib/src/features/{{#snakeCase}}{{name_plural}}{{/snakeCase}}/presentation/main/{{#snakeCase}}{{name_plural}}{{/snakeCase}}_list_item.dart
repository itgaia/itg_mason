import 'package:dev_framework_tutorial/src/app/constants.dart';
import 'package:flutter/material.dart';

import '../../../../app/injection_container.dart';
import '../../../../common/helper.dart';
import '../../data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import '../../domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import '../../domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_support.dart';

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListItem extends StatelessWidget {
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model item;

  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String baseLogMsg = '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}ListItem]';
    itgLogVerbose('$baseLogMsg build start...');
    itgLogVerbose('$baseLogMsg {{#snakeCase}}{{name_singular}}{{/snakeCase}}: $item');
    // final textTheme = Theme.of(context).textTheme;
    return Material(
      child: {{#pascalCase}}{{name_plural}}{{/pascalCase}}Card(item: item)
    );
  }
}

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}Card extends StatelessWidget {
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model item;
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Card({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.lightBlue[50]),
        // child: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListTile(item: item),
        child: {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListItemView(item: item),
      ),
    );
  }
}

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListItemView extends StatelessWidget {
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model item;

  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListItemView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Title(item: item),
                {{#fields}}{{^is_title}}_{{#pascalCase}}{{field_name}}{{/pascalCase}}(item: item),{{/is_title}}{{/fields}}
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>().getActionsListForListItem(context: context, data: item, baseKeyName: '$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase-${item.id}'),
            ],
            key: Key(keyNameGenerator(
                keyElement: KeyElement.widget,
                feature: [keyAbbrFeature{{#pascalCase}}{{name_plural}}{{/pascalCase}}, keyAbbrListItem],
                id: item.id,
                suffix: 'actions')),
          ),
        ],
      ),
    );
  }
}

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListTile extends StatelessWidget {
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model item;
  final DismissDirectionCallback? onDismissed;

  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ListTile({Key? key, required this.item, this.onDismissed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // TODO: Implement actions (edit, duplicate, delete)
    //       How can I have buttons in Dismissible?
    //       maybe use flutter_slidable package instead...
    return Dismissible(
      key: Key('todoListTile_dismissible_${item.id}'),
      onDismissed: onDismissed,
      direction: DismissDirection.endToStart,
      confirmDismiss: (dismissDirection) async => false,
      background: Container(
        alignment: Alignment.centerRight,
        color: theme.colorScheme.error,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(
          Icons.delete,
          color: Color(0xAAFFFFFF),
        ),
      ),
      child: ListTile(
        title: _Title(item: item),
        subtitle: Column(
          children: [
            {{#fields}}{{^is_title}}_{{#pascalCase}}{{field_name}}{{/pascalCase}}(item: item),{{/is_title}}{{/fields}}
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model item;
  const _Title({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Text(
            item.title,
            // style: Theme.of(context).textTheme.caption,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            key: Key(keyNameGenerator(
                keyElement: KeyElement.widget,
                feature: [keyAbbrFeature{{#pascalCase}}{{name_plural}}{{/pascalCase}}, keyAbbrListItem],
                id: item.id,
                field: 'title'))
        ),
        onTap: () async {
          var result = await sl<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Support>().actionItemShow(context: context, data: item);
          itgLogVerbose('baseLogMsg onTap - after return from item screen - result: $result');
        },
        key: Key(keyNameGenerator(
            keyElement: KeyElement.widget,
            feature: [keyAbbrFeature{{#pascalCase}}{{name_plural}}{{/pascalCase}}, keyAbbrListItem],
            id: item.id,
            action: KeyAction.show))
    );
  }
}

//** fields except title start **//
{{#fields}}{{^is_title}}class _{{#pascalCase}}{{field_name}}{{/pascalCase}} extends StatelessWidget {
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model item;
  const _{{#pascalCase}}{{field_name}}{{/pascalCase}}({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Text(
            item.{{#camelCase}}{{field_name}}{{/camelCase}},
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            key: Key(keyNameGenerator(
                keyElement: KeyElement.widget,
                feature: [keyAbbrFeature{{#pascalCase}}{{name_plural}}{{/pascalCase}}, keyAbbrListItem],
                id: item.id,
                field: '{{#camelCase}}{{field_name}}{{/camelCase}}'))
        ),
      ),
    );
  }
}{{/is_title}}{{^is_last}}

{{/is_last}}{{/fields}}
//** fields except title end **//
