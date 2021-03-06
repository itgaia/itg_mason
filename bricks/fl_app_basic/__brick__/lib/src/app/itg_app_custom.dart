import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'app_config.dart';
import '../common/helper.dart';
import '../common/itg_custom.dart';
import '../common/itg_localization.dart';
import '../features/{feature_name_sc}/domain/{feature_name_sc}_helper.dart';

const appTitleFull = '{{app_descr}}';

Map<String, Map<String, String>> _localizedValues = {
  'en': {
    'appWindowTitle': '{{#pascalCase}}{{app_name}}{{/pascalCase}}',
    'appTitle': appTitleFull,

    //** translations en **//
  },
};

Future<void> customizeApp() async {
  itgLogVerbose('[ItgAppCustom.customizeApp]');
  _localizedValues['el'] = {
    'appWindowTitle': _localizedValues['en']!['appWindowTitle']!,
    'appTitle': _localizedValues['en']!['appTitle']!,

    //** translations el **//
  };
  ItgLocalization.custom(_localizedValues);
  debugPaintSizeEnabled = appDebugPaintSizeEnabled;

  //** custom app settings **//
}

class ItgAppCustom extends ItgCustom {
  // TODO: refactor in order not to override fields!
  @override
  MaterialColor colorAppMain = Colors.orange;

  @override
  Color colorAppSecondary = Colors.lightGreen;
}
