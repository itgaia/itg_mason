import 'package:dev_framework_tutorial/src/app/constants.dart';
import 'package:flutter/cupertino.dart';

import '../../../app/app_private_config.dart';
import '../data/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';

// key name abbreviation constants for feature - unique
const keyAbbrFeature{{#pascalCase}}{{name_plural}}{{/pascalCase}} = '{{#lowerCase}}{{abbreviation}}{{/lowerCase}}';

const appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}} = '{{#pascalCase}}{{name_plural}}{{/pascalCase}}';
const appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item = '{{#pascalCase}}{{name_singular}}{{/pascalCase}}';
const appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemAddPage = 'New $appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item';
const appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemEditPage = 'Edit $appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item';
const appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemDuplicatePage = 'Duplicate $appTitle{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item';

const url{{#pascalCase}}{{name_plural}}{{/pascalCase}} = '$serverUrl/{{#snakeCase}}{{name_plural}}{{/snakeCase}}';

const keyButton{{#pascalCase}}{{name_plural}}{{/pascalCase}}Page = Key('button-{{#snakeCase}}{{name_plural}}{{/snakeCase}}-page');

const key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetBase = '$keyAbbrSourceWidget-$keyAbbrFeature{{#pascalCase}}{{name_plural}}{{/pascalCase}}';
const key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetListItemBase = '$keyAbbrSourceWidget-$keyAbbrFeature{{#pascalCase}}{{name_plural}}{{/pascalCase}}-$keyAbbrListItem';
const key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemShowBase = '$keyAbbrSourceWidget-$keyAbbrFeature{{#pascalCase}}{{name_plural}}{{/pascalCase}}-$keyAbbrItem$keyAbbrShow';
const key{{#pascalCase}}{{name_plural}}{{/pascalCase}}WidgetItemAddEditBase = '$keyAbbrSourceWidget-$keyAbbrFeature{{#pascalCase}}{{name_plural}}{{/pascalCase}}-$keyAbbrItem$keyAbbrAddEdit';

// assets
const asset{{#pascalCase}}{{name_plural}}{{/pascalCase}}Fixture = '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_fixture_asset.json';
const asset{{#pascalCase}}{{name_plural}}{{/pascalCase}}ResponseFixture = '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_response_fixture.json';
const asset{{#pascalCase}}{{name_plural}}{{/pascalCase}}ItemCreateResponseFixture = '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_item_create_response_fixture.json';

List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> {{#snakeCase}}{{name_plural}}{{/snakeCase}}SampleData({int count = 5}) => List.generate(
    count,
        (i) => {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(id: '${i+1}', description: 'test description ${i+1}', content: 'test content ${i+1}')
);