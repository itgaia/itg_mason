import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:basic_utils/basic_utils.dart';

import '../app/app_config.dart';
import '../app/app_private_config.dart';
import '../app/constants.dart';

/// Used when we want to print something for debugging even if appDebugMode is false
void itgLogPrint(String msg) {
  if (kDebugMode) {
    print(msg);
  }
}

void itgLogVerbose(String msg) {
  if (appDebugMode) {
    if (kDebugMode) {
      print(msg);
    }
  }
}

void itgLogWarning(String msg) => itgLogVerbose(msg);

void itgLogError(String msg) {
  if (kDebugMode) {
    print('*** Error: $msg');
  }
}

// TODO: support also camelCase and PascalCase
String _snakeCase(String value) {
  if (StringUtils.isNullOrEmptyOrBlank(value)) {
    return '';
  }
  else if (value.contains('_')) {
    return value.toLowerCase();
  }
  else if (value.contains('-')) {
    return value.replaceAll('-', '_').toLowerCase();
  } else {
    return value.toLowerCase();
  }
}

/// Returns the full url
/// suffix: it is the last part of the url (does not contain '/' as first char
String getServerUrl(String feature, {String? suffix}) {
  itgLogVerbose('feature: $feature, feature.isEmpty: ${feature.isEmpty}, StringUtils.isNullOrEmpty(feature): ${StringUtils.isNullOrEmpty(feature)}');
  if (StringUtils.isNullOrEmptyOrBlank(feature)) {
    return '';
  }
  String url = '$serverUrl/${_snakeCase(feature)}';
  if (StringUtils.isNotNullOrEmptyOrBlank(suffix)) {
    if (suffix!.contains('/', 0)) throw('[getServerUrl] suffix ($suffix) starts with "/"');
    url = '$url/$suffix';
  }
  if (systemUnderTesting) url = '$url?test';
  return url;
}

abstract class KeyElement {
  static String widget = keyAbbrSourceWidget;
}

abstract class KeyAction {
  static String add = keyActionAdd;
  static String edit = keyActionEdit;
  static String duplicate = keyActionDuplicate;
  static String delete = keyActionDelete;
  static String refresh = keyActionRefresh;
  static String show = keyActionShow;
  static String addFloating = keyFloatingActionAdd;
  static String editFloating = keyFloatingActionEdit;
  static String duplicateFloating = keyFloatingActionDuplicate;
  static String deleteFloating = keyFloatingActionDelete;
  static String refreshFloating = keyFloatingActionRefresh;
}

String keyNameGenerator({
  required String keyElement,
  required List<String> feature,
  String? action,
  String? id,
  String? field,
  String? prefix,
  String? suffix,
}) {
  return [prefix, keyElement, ...feature, id, action, field, suffix]
    .where((element) => element != null)
    .join(keyNameSeparator);
}

Text widgetText(BuildContext context, String text, {required Key key}) {
  return Text(
      text,
      style: TextStyle(
        color: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? Colors.green.shade900
            : Colors.green,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      ),
      textAlign: TextAlign.center,
      key: key
  );
}


/// Return the Map which contains the id for the mongodb
Map<String, dynamic> buildIdMapForMongoDb(String? id) {
  itgLogVerbose('[buildIdMap] id: $id (${id.runtimeType})');
  return {r"$oid":"$id"};
}

/// extract the id from the passing value
/// in rails the mongoid is a json map: {$oid: 60d9dd274558eb83d09ba052}
String getId(dynamic id) {
  itgLogVerbose('[getId] id: $id (${id.runtimeType})');
  // if (id is _JsonMap) {
  const String prefix = r'{$oid: ';
  const String suffix = r'}';
  if (id.toString().substring(0, 7) == prefix) {          // {$oid: 60bc95f4fe748d3ffc6936ad}
    return id.toString().replaceAll(prefix, '').replaceAll(suffix, '');
  } else if (id is String && id.length == 24) {
    return id;
  } else {
    throw '[getId] id "$id" (${id.runtimeType}, ${id.subtype}, ${id.toString().length}) is not handled';
  }
}

/// Convert json value to string
String jsonValueAsString(dynamic value, {String valueType = 'string'}) {
  itgLogVerbose('jsonValueDoubleAsString - value: $value (${value.runtimeType}), valueType: $valueType');
  if (value == null || value == '') {
    if (['double','int'].contains(valueType)) {
      return '';
    } else {
      return '';
    }
  }
  else {
    if (valueType == 'date') {
      if (value.toString().length >= 10) {
        return value.toString().substring(0, 10).split('-').reversed.join('/');
      } else {
        if (value.toString().contains('-')) {
          List<String> parts = value.toString().split('-').toList();
          if (parts.first.length == 2) parts.first = '20${parts.first}';
          if (parts[1].length == 1) parts[1] = '0${parts[1]}';
          if (parts[2].length == 1) parts[2] = '0${parts[2]}';
          return parts.reversed.join('/');
        } else if (value.toString().contains('/')) {
          List<String> parts = value.toString().split('/').toList();
          if (parts.last.length == 2) parts.last = '20${parts.last}';
          if (parts[0].length == 1) parts[0] = '0${parts[0]}';
          if (parts[1].length == 1) parts[1] = '0${parts[1]}';
          return parts.join('/');
        } else {
          return value.toString();
        }
      }
    } else if (valueType == 'decimal') {
      return value.toString().replaceAll('.', ',');
    } else {
      return value.toString();
    }
  }
}

/// Return the json string as value
dynamic jsonStringAsValue(String? value, {String valueType = 'string'}) {
  itgLogVerbose('[jsonStringAsValue] value: $value, valueType: $valueType');
  if (valueType == 'date') {
    return DateTime.parse(jsonStringAsStringValue(value));
  }
  else {
    return value;
  }
}

/// Convert value back to json readable form string
String jsonStringAsStringValue(String? value, {String valueType = 'string'}) {
  // itgLogVerbose('jsonStringAsStringValue - value: $value, valueType: $valueType');
  if (value == null || value == '') {
    return valueType == 'decimal' ? '0' : '';
  } else if (valueType == 'date') {
    List<String> parts = value.split('/').reversed.toList();
    if (parts.first.length == 2) parts.first = '20${parts.first}';
    return parts.join('-');
  }
  else if (valueType == 'decimal') {
    return value.toString().replaceAll(',', '.');
  }
  else {
    return value;
  }
}

/// returns the key name of the key
String keyName(Key key) => key.toString().replaceAll("[<'", '').replaceAll("'>]", '');

void showNotification({required BuildContext context, required String msg, Key? key}) {
  itgLogVerbose('showNotification - $msg, key: $key');
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(msg),
        backgroundColor: Colors.green,
        key: key
    ),
  );
}

void showNotificationFailure({required BuildContext context, required String msg})
  => showNotification(context: context, msg: msg, key: keyNotificationFailure);
void showNotificationSuccess({required BuildContext context, required String msg})
  => showNotification(context: context, msg: msg, key: keyNotificationSuccess);
void showNotificationInfo({required BuildContext context, required String msg})
  => showNotification(context: context, msg: msg, key: keyNotificationInfo);

Widget buttonDoAction({required BuildContext context, required String tooltip,
  required VoidCallback onAction, IconData? icon, Key? key}) {
  return Tooltip(
    message: tooltip,
    child: TextButton(
        onPressed: onAction,
        child: Icon(icon, size: 24),
        key: key
    ),
  );
}

Widget buttonFloatingAction({required BuildContext context, required String tooltip,
  required VoidCallback onAction, required Key key, IconData? icon, bool mini = false}) {
  return Padding(
    padding: const EdgeInsets.only(left: 4.0),
    child: FloatingActionButton(
        tooltip: tooltip,
        // backgroundColor: Colors.purple,
        onPressed: onAction,
        mini: mini,
        child: Icon(icon, size: 24),
        heroTag: keyName(key),
        key: key
    ),
  );
}

String textMessageToDisplayNoData({required String dataModelName})
  => 'There are no $dataModelName';

String textMessageToDisplayDeleteItem({required String dataModelName, required String itemTitle})
  => 'Successfully deleted item "$itemTitle" in $dataModelName';

String textMessageToDisplayError({required String dataModelName, required String errorMessage}) {
  final String ret = 'failed to fetch $dataModelName ($errorMessage})';
  itgLogError(ret);
  return ret;
}

Future<String> loadAsset(String fileName) async {
  return await rootBundle.loadString('assets/files/$fileName');
}

// Prefix content with a code
// mkd - markdown: markdown content
//     - normal: all other content
const String prefixSpecialContent = '%%%';
const String splitOnSpecialContent = '%:%';
String getSimpleTextFromSpecialContent(String content) {
  return content.replaceAll('${prefixSpecialContent}mkd$splitOnSpecialContent', '');
}
