import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/common/helper.dart';

import '../data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';

const feature{{#pascalCase}}{{name_plural}}{{/pascalCase}} = '{{#paramCase}}{{name_plural}}{{/paramCase}}';

// key name abbreviation constants for feature - unique
const keyAbbrFeature{{#pascalCase}}{{name_plural}}{{/pascalCase}} = '{{#lowerCase}}{{abbreviation}}{{/lowerCase}}';

Future<bool> networkInfoIsConnectedFor{{#pascalCase}}{{name_plural}}{{/pascalCase}} = Future.value(false);
bool useMongoDbBackendFor{{#pascalCase}}{{name_plural}}{{/pascalCase}} = false;

const appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}} = '{{#titleCase}}{{name_plural}}{{/titleCase}}';
const appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item = '{{#titleCase}}{{name_singular}}{{/titleCase}}';
const appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddPage = 'New $appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item';
const appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemEditPage = 'Edit $appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item';
const appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDuplicatePage = 'Duplicate $appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item';

const keyButton{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page = Key('button-{{#paramCase}}{{name_plural}}{{/paramCase}}-page');

const key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetBase = '$keyAbbrSourceWidget-$keyAbbrFeature{{#pascalCase}}{{name_plural}}{{/pascalCase}}';
const key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase = '$keyAbbrSourceWidget-$keyAbbrFeature{{#pascalCase}}{{name_plural}}{{/pascalCase}}-$keyAbbrListItem';
const key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase = '$keyAbbrSourceWidget-$keyAbbrFeature{{#pascalCase}}{{name_plural}}{{/pascalCase}}-$keyAbbrItem$keyAbbrShow';
const key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase = '$keyAbbrSourceWidget-$keyAbbrFeature{{#pascalCase}}{{name_plural}}{{/pascalCase}}-$keyAbbrItem$keyAbbrAddEdit';

// assets
const asset{{#pascalCase}}{{name_plural}}{{/pascalCase}}Fixture = '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_fixture_asset.json';
const asset{{#pascalCase}}{{name_plural}}{{/pascalCase}}ResponseFixture = '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_response_fixture.json';
const asset{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemCreateResponseFixture = '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_create_response_fixture.json';

Map<String, dynamic> fields{{#pascalCase}}{{name_plural}}{{/pascalCase}} = {
  'code': {'kind': 'field', 'type': 'string', 'label': 'Code', 'required': true},
  'notes': {'kind': 'field', 'type': 'string', 'label': 'Notes', 'required': false},
};

List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> items{{#pascalCase}}{{name_plural}}{{/pascalCase}}Sample({int count = 5}) => List.generate(
    count,
        (i) => {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(id: '${i+1}', {{#fields}}{{#camelCase}}{{field_name}}{{/camelCase}}: 'test {{#camelCase}}{{field_name}}{{/camelCase}} ${i+1}'{{^is_last}}, {{/is_last}}{{/fields}})
);

{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model item{{#pascalCase}}{{name_plural}}{{/pascalCase}}Sample() => items{{#pascalCase}}{{name_plural}}{{/pascalCase}}Sample().first;

Map<String, dynamic> item{{#pascalCase}}{{name_plural}}{{/pascalCase}}ObjectAsString({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model item, {bool omitEmpty = true}) {
  Map<String, dynamic> ret = {};
  for (var element in {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model.fields) {
    if (!omitEmpty || (omitEmpty && item[element].toString().isNotEmpty)) {
      if (element == 'id' && useMongoDbBackendFor{{#pascalCase}}{{name_plural}}{{/pascalCase}}) {
        ret['_id'] = buildIdMapForMongoDb(item[element]);
      } else {
        ret[element] = item[element];
      }
    }
  }
  return ret;
}

/// Returns an id for testing purposes (check for
String getIdForTesting(String suffix) {
  if (useMongoDbBackendFor{{#pascalCase}}{{name_plural}}{{/pascalCase}}) {
    return sampleIdForMongoDb.substring(0, sampleIdForMongoDb.length-suffix.length) + suffix;
  } else {
    return suffix;
  }
}
