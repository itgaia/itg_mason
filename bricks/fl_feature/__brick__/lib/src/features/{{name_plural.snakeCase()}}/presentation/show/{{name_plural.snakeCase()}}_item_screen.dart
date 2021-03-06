import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/common/etc/itg_text.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/{{#snakeCase}}{{name_plural}}{{/snakeCase}}/data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';
import 'package:flutter/material.dart';

import '../../domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemScreen extends StatelessWidget {
  final {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model data;

  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemScreen({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            ItgTextWithLabel(
              label: 'ID',
              text: data.id == null ? '<not assigned>' : data.id!,
              key: const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-col1-id')
            ),
            //** fields start **//
            {{#fields}}ItgTextWithLabel(
              label: '{{#pascalCase}}{{field_name}}{{/pascalCase}}',
              text: data.{{#camelCase}}{{field_name}}{{/camelCase}},
              key: const Key('$key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase-col1-{{#paramCase}}{{field_name}}{{/paramCase}}')
            ),{{^is_last}}
            {{/is_last}}{{/fields}}
            //** fields end **//
          ],
        ),
      )
    );
  }
}
