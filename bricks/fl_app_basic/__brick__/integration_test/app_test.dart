import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/itg_app_custom.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/common/helper.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/app.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/constants.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/features/home/home_page.dart';

import '../test/common/test_helper.dart';

const useDelays = false;
const msgBaseSourceClass = 'app_test';
String msgBaseSourceMethod = '';
void msgLogInfo(String msg) => itgLogVerbose('[$msgBaseSourceClass/$msgBaseSourceMethod] $msg');
void msgLogPrint(String msg) => itgLogPrint('[$msgBaseSourceClass/$msgBaseSourceMethod] $msg');

// TODO: Refactor - The tests here are depended - The next needs the previous to have run successfully...
// TODO: Refactor - If the new data is outside of the visible area it must bu scrolled down in order for the tests to work...
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    setUp(() async {
      await initializeAppForTesting();
    });

    testWidgets('show home page', (WidgetTester widgetTester) async {
      await widgetTester.pumpWidget(const App());
      await widgetTester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
      expect(find.text(appTitleFull), findsOneWidget);
      expect(find.text(textHomePageWelcomeMessage1), findsOneWidget);
      expect(find.text(textHomePageWelcomeMessage2), findsNothing);

      if (useDelays) await Future.delayed(const Duration(seconds: 2));
    }, skip: false);
  });
}
