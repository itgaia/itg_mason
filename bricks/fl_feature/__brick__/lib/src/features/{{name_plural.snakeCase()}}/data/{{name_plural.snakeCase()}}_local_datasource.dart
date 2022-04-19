import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/injection_container.dart';
import '../../../common/helper.dart';
import '../domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';

const msgBaseSourceClass = '{{#pascalCase}}{{name_plural}}{{/pascalCase}}LocalDataSourceImpl';
String msgBaseSourceMethod = '';
void msgLogInfo(String msg) => itgLogVerbose('[$msgBaseSourceClass/$msgBaseSourceMethod] $msg');

abstract class {{#pascalCase}}{{name_plural}}{{/pascalCase}}LocalDataSource {
  Future<List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>> get{{#pascalCase}}{{name_plural}}{{/pascalCase}}({String query = ''});
  Future<void> remove{{#pascalCase}}{{name_singular}}{{/pascalCase}}(id);
  Future<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> add{{#pascalCase}}{{name_singular}}{{/pascalCase}}({{#camelCase}}{{name_singular}}{{/camelCase}});
  Future<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> edit{{#pascalCase}}{{name_singular}}{{/pascalCase}}({{#camelCase}}{{name_singular}}{{/camelCase}});

  Future<void> cache{{#pascalCase}}{{name_plural}}{{/pascalCase}}(List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> {{#camelCase}}{{name_plural}}{{/camelCase}}ToCache);
}

const cached{{#pascalCase}}{{name_plural}}{{/pascalCase}}Key = 'CACHED_{{#upperCase}}{{name_singular}}{{/upperCase}}S';
const textMultiLine = '''This is a multi-line text sample.
Testing line 2
Testing line 3

This a new paragraph
With 2nd line
and a 3rd line''';

// const itemLongContent = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(
//   id: '4',
//   description: 'A {{#snakeCase}}{{name_singular}}{{/snakeCase}} with a long content',
//   content: textMultiLine
// );

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}LocalDataSourceImpl implements {{#pascalCase}}{{name_plural}}{{/pascalCase}}LocalDataSource {

  {{#pascalCase}}{{name_plural}}{{/pascalCase}}LocalDataSourceImpl();

  @override
  Future<List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>> get{{#pascalCase}}{{name_plural}}{{/pascalCase}}({String query = ''}) {
    itgLogVerbose('>>> {{#pascalCase}}{{name_plural}}{{/pascalCase}}LocalDataSourceImpl.get{{#pascalCase}}{{name_plural}}{{/pascalCase}} - query: $query');
    return _getLast{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
  }

  @override
  Future<void> remove{{#pascalCase}}{{name_singular}}{{/pascalCase}}(id) async {
    // return Future.value(null);
  }

  @override
  Future<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> add{{#pascalCase}}{{name_singular}}{{/pascalCase}}({{#camelCase}}{{name_singular}}{{/camelCase}}) {
    itgLogVerbose('[{{#pascalCase}}{{name_plural}}{{/pascalCase}}LocalDataSourceImpl.add{{#pascalCase}}{{name_singular}}{{/pascalCase}}] not implemented yet...');
    // return Future.value(const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model(description: 'description 11', content: 'content 11'));
    return Future.value(item{{#pascalCase}}{{name_plural}}{{/pascalCase}}Sample());
  }

  @override
  Future<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> edit{{#pascalCase}}{{name_singular}}{{/pascalCase}}({{#camelCase}}{{name_singular}}{{/camelCase}}) {
    return Future.value({{#camelCase}}{{name_singular}}{{/camelCase}});
  }

  Future<List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>> _getLast{{#pascalCase}}{{name_plural}}{{/pascalCase}}() async {
    msgBaseSourceMethod = 'getLast{{#pascalCase}}{{name_plural}}{{/pascalCase}}';
    msgLogInfo('start...');
    String? jsonString = sl<SharedPreferences>().getString(cached{{#pascalCase}}{{name_plural}}{{/pascalCase}}Key);
    msgLogInfo('jsonString: $jsonString');

    // jsonString = null;
    late List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> items;
    if (jsonString == null) {
      items = items{{#pascalCase}}{{name_plural}}{{/pascalCase}}Sample(count: 2);
      // items = {{#camelCase}}{{name_plural}}{{/camelCase}}SampleData(count: 13);
      // items[3] = itemLongContent;
      // cache{{#pascalCase}}{{name_plural}}{{/pascalCase}}(items);
    } else {
      items = (json.decode(jsonString) as List).map((dynamic json) {
        return {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model.fromJson(json);
      }).toList();
    }
    return Future.value(items);

    // } else {
    //   throw const CacheException();
    // }
  }

  @override
  Future<bool> cache{{#pascalCase}}{{name_plural}}{{/pascalCase}}(List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> {{#camelCase}}{{name_plural}}{{/camelCase}}ToCache) async {
    msgLogInfo('>>> cache{{#pascalCase}}{{name_plural}}{{/pascalCase}} - {{#camelCase}}{{name_plural}}{{/camelCase}} string to save: ${json.encode({{#camelCase}}{{name_plural}}{{/camelCase}}ToCache.map(({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {{#camelCase}}{{name_singular}}{{/camelCase}}) => {{#camelCase}}{{name_singular}}{{/camelCase}}.toJson()).toList())}');
    return sl<SharedPreferences>().setString(
      cached{{#pascalCase}}{{name_plural}}{{/pascalCase}}Key,
      json.encode({{#camelCase}}{{name_plural}}{{/camelCase}}ToCache.map(({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {{#camelCase}}{{name_singular}}{{/camelCase}}) => {{#camelCase}}{{name_singular}}{{/camelCase}}.toJson()).toList()),
    );
  }
}
