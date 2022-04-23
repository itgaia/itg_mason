import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../common/helper.dart';
import '../../../core/error/exception.dart';
import '../domain/{{#snakeCase}}{{name_plural}}{{/snakeCase}}_helper.dart';
import '{{#snakeCase}}{{name_plural}}{{/snakeCase}}_model.dart';

const msgBaseSourceClass = '{{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSource';
String msgBaseSourceMethod = '';
void msgLogInfo(String msg) => itgLogVerbose('[$msgBaseSourceClass/$msgBaseSourceMethod] $msg');

abstract class {{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>> get{{#pascalCase}}{{name_plural}}{{/pascalCase}}();
  Future<List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>> search{{#pascalCase}}{{name_plural}}{{/pascalCase}}(query);
  Future<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {{#camelCase}}{{name_plural}}{{/camelCase}}Item);
  Future<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model {{#camelCase}}{{name_plural}}{{/camelCase}}Item);
  Future<void> delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(String id);
}

class {{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSourceImpl implements {{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSource {
  final http.Client client;

  {{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSourceImpl({required this.client});

  @override
  Future<List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>> search{{#pascalCase}}{{name_plural}}{{/pascalCase}}(query) async {
    itgLogVerbose('>>> {{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSourceImpl.search{{#pascalCase}}{{name_plural}}{{/pascalCase}} ---- query: $query');
    return items{{#pascalCase}}{{name_plural}}{{/pascalCase}}Sample();
  }

  @override
  Future<List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>> get{{#pascalCase}}{{name_plural}}{{/pascalCase}}() async => _get{{#pascalCase}}{{name_plural}}{{/pascalCase}}FromUrl(getServerUrl(feature{{#pascalCase}}{{name_plural}}{{/pascalCase}}));

  /// Returns data (List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>) or a ServerException is raised
  Future<List<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>> _get{{#pascalCase}}{{name_plural}}{{/pascalCase}}FromUrl(String url) async {
    const String baseLogMsg = '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSourceImpl._get{{#pascalCase}}{{name_plural}}{{/pascalCase}}FromUrl]';
    itgLogVerbose('$baseLogMsg url: $url');
    try {
      final {{#camelCase}}{{name_plural}}{{/camelCase}}Url = Uri.parse(url);
      final response = await client.get(
        {{#camelCase}}{{name_plural}}{{/camelCase}}Url,
        headers: {'Content-Type': 'application/json'},
      );
      itgLogVerbose('$baseLogMsg response.statusCode: ${response.statusCode}');
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body
          .map<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model>((json) => {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model.fromJson(json))
          .toList();
      } else {
        throw ServerException(description: 'Invalid response "${response.statusCode}"...');
      }
    } on ServerException catch (e) {
      itgLogError('$baseLogMsg Server exception: $e');
      rethrow;
    } catch (e) {
      itgLogError('$baseLogMsg exception: $e');
      throw ServerException(description: e.toString());
    }
  }

  @override
  Future<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model data) async {
    const String baseLogMsg = '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSourceImpl.create{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item]';
    try {
      final url = Uri.parse(getServerUrl(feature{{#pascalCase}}{{name_plural}}{{/pascalCase}}));
      itgLogVerbose('$baseLogMsg url: $url');
      final response = await client.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data.toJson())
      );
      itgLogVerbose('$baseLogMsg response.statusCode: ${response.statusCode}');
      if ([200,201].contains(response.statusCode)) {
        itgLogVerbose('$baseLogMsg success...');
        final retData = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model.fromJson(json.decode(response.body));
        return retData;
      } else {
        itgLogVerbose('$baseLogMsg fail - response code "${response.statusCode}"');
        throw ServerException(description: '$baseLogMsg Failed tp create item with response code "${response.statusCode}"...');
      }
    } on ServerException catch (e) {
      itgLogError('$baseLogMsg Server exception: $e');
      rethrow;
    } catch (e) {
      itgLogError('$baseLogMsg Unhandled exception: $e');
      throw ServerException(description: e.toString());
    }
  }

  @override
  Future<{{#pascalCase}}{{name_plural}}{{/pascalCase}}Model> update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item({{#pascalCase}}{{name_plural}}{{/pascalCase}}Model data) async {
    const String baseLogMsg = '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSourceImpl.update{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item]';
    final body = jsonEncode(data.toJson());
    itgLogVerbose('$baseLogMsg data: $data');
    itgLogVerbose('$baseLogMsg body: $body');
    try {
      final url = Uri.parse(getServerUrl(feature{{#pascalCase}}{{name_plural}}{{/pascalCase}}, suffix: data.id));
      itgLogVerbose('$baseLogMsg url: $url');
      final response = await client.put(
          url,
          headers: {'Content-Type': 'application/json'},
          body: body
      );
      itgLogVerbose('$baseLogMsg response.statusCode: ${response.statusCode}');
      if ([200,204].contains(response.statusCode)) {
        itgLogVerbose('$baseLogMsg response.body: ${response.body}');
        {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model retData;
        if (response.body.isNotEmpty) {
          retData = {{#pascalCase}}{{name_plural}}{{/pascalCase}}Model.fromJson(json.decode(response.body));
        } else {
          // TODO: Do I need this one?
          retData = data.copyWith();
        }
        return retData;
      } else {
        throw ServerException(description: '$baseLogMsg Failed tp update item with response code "${response.statusCode}"...');
      }
    } on ServerException catch (e) {
      itgLogError('$baseLogMsg Server exception: $e');
      rethrow;
    } catch (e) {
      itgLogError('$baseLogMsg Unhandled exception: $e');
      throw ServerException(description: e.toString());
    }
  }

  @override
  Future<void> delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item(String id) async {
    const String baseLogMsg = '[{{#pascalCase}}{{name_plural}}{{/pascalCase}}RemoteDataSourceImpl.delete{{#pascalCase}}{{name_plural}}{{/pascalCase}}Item]';
    try {
      final url = Uri.parse(getServerUrl(feature{{#pascalCase}}{{name_plural}}{{/pascalCase}}, suffix: id));
      itgLogVerbose('$baseLogMsg url: $url');
      final response = await client.delete(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      itgLogVerbose('$baseLogMsg response.statusCode: ${response.statusCode}');
      if (![200,204].contains(response.statusCode)) {
        throw ServerException(description: '$baseLogMsg Failed tp delete item "$id" with response code "${response.statusCode}"...');
      }
    } on ServerException catch (e) {
      itgLogError('$baseLogMsg Server exception: $e');
      rethrow;
    } catch (e) {
      itgLogError('$baseLogMsg Unhandled exception: $e');
      throw ServerException(description: e.toString());
    }
  }
}
