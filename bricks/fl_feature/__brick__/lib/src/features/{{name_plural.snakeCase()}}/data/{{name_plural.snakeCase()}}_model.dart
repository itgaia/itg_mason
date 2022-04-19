// @JsonSerializable(includeIfNull: false)
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/helper.dart';

part '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.freezed.dart';
part '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.g.dart';

@freezed
class {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model with _${{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {
  const {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model._();
  const factory {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model({
    // TODO: How can I refactor it in order to use the useMongoDbBackend?
    // @ObjectIdJsonConverter() @JsonKey(name: '_id', toJson: omitEmpty, includeIfNull: false) String? id,
    @JsonKey(toJson: omitEmpty, includeIfNull: false) String? id,
    //** fields start **//
    {{#fields}}{{#required}}@JsonKey(toJson: omitEmpty) required String {{#camelCase}}{{field_name}}{{/camelCase}},
    {{/required}}{{^required}}@Default('') @JsonKey(toJson: omitEmpty, includeIfNull: false) String {{#camelCase}}{{field_name}}{{/camelCase}},{{^is_last}}
    {{/is_last}}{{/required}}{{/fields}}
    //** fields end **//
    @Default('') @JsonKey(name: 'created_at', toJson: omitEmpty, includeIfNull: false) String createdAt,
    @Default('') @JsonKey(name: 'updated_at', toJson: omitEmpty, includeIfNull: false) String updatedAt,
  }) = _{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model;

  factory {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model.fromJson(Map<String, dynamic> json) =>
      _${{#pascalCase}}{{name_plural}}{{/pascalCase}}ModelFromJson(json);

  String get title => [{{#fields}}{{#is_title}}{{#camelCase}}{{field_name}}{{/camelCase}}{{^is_last_title}},{{/is_last_title}}{{/is_title}}{{/fields}}].join(',');

  static const List<String> fields = ['id', {{#fields}}'{{#camelCase}}{{field_name}}{{/camelCase}}', {{/fields}}'createdAt', 'updatedAt'];

  // TODO: refactor - how can I access properties by name?
  dynamic getProp(String key) => <String, dynamic>{
    'id': id,
    'title': title,
    {{#fields}}'{{#camelCase}}{{field_name}}{{/camelCase}}': {{#camelCase}}{{field_name}}{{/camelCase}},{{^is_last}}
    {{/is_last}}{{/fields}}
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  }[key];
  // or use this one?
  dynamic operator[](prop) {
    if (prop == "id") { return id; }
    else if (prop == "title") { return title; }
    {{#fields}}else if (prop == "{{#camelCase}}{{field_name}}{{/camelCase}}") { return {{#camelCase}}{{field_name}}{{/camelCase}}; }{{^is_last}}
    {{/is_last}}{{/fields}}
    else if (prop == "createdAt") { return createdAt; }
    else if (prop == "updatedAt") { return updatedAt; }
    else { throw('unknown property: $prop'); }
  }
}

omitEmpty(value) {
  itgLogVerbose('omitEmpty - value: $value');
  return value == null || value == '' ? null : value;
}

class ObjectIdJsonConverter implements JsonConverter<String?, Map<String, dynamic>> {
  const ObjectIdJsonConverter();

  @override
  String? fromJson(Map<String, dynamic> json) => getId(json);

  @override
  Map<String, dynamic> toJson(String? object) => {r"$oid":"$object"};
}

class DateStringJsonConverter implements JsonConverter<String, String> {
  const DateStringJsonConverter();

  @override
  String fromJson(String json) => jsonValueAsString(json);

  @override
  String toJson(String object) => jsonStringAsStringValue(object, valueType: 'date');
}

