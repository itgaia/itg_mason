import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/app.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/bootstrap.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeApp(forTesting: false);

  bootstrap(() => const App());
}
