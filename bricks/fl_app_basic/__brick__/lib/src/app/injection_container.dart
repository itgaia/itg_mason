// ignore_for_file: unused_import

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mockingjay/mockingjay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import '../features/settings/settings_controller.dart';
import '../features/settings/settings_service.dart';

//** imports **//

class MockHttpClient2 extends Mock implements http.Client {}  // return sample data

final sl = GetIt.instance;       // Service Locator

Future<void> init({bool forTesting = false}) async {
  if (!sl.isRegistered<SettingsService>()) {
    sl.registerLazySingleton(() => SettingsService());
  }
  if (!sl.isRegistered<SettingsController>()) {
    sl.registerLazySingleton(() => SettingsController(sl()));
  }
  if (!sl.isRegistered<SharedPreferences>()) {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerSingletonAsync(() async => sharedPreferences);
  }
  if (!sl.isRegistered<http.Client>()) {
    sl.registerLazySingleton(() => http.Client());
  }

  //** registrations **//
}
