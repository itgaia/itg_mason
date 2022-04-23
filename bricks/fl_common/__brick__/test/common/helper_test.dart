import 'package:flutter_test/flutter_test.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/app_config.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/app/app_private_config.dart';
import 'package:{{#snakeCase}}{{app_name}}{{/snakeCase}}/src/common/helper.dart';

void main() {
  group('getServerUrl', () {
    test('getServerUrl - valid results', () {
      systemUnderTesting = false;
      expect(getServerUrl(''), equals(''));
      expect(getServerUrl(' '), equals(''));
      expect(getServerUrl('links'), equals('$serverUrl/links'));
      expect(getServerUrl('Links'), equals('$serverUrl/links'));
      expect(getServerUrl('LINKS'), equals('$serverUrl/links'));
      expect(getServerUrl('links_feature'), equals('$serverUrl/links_feature'));
      // expect(getServerUrl('linksFeature'), equals('$serverUrl/links_feature'));
      // expect(getServerUrl('LinksFeature'), equals('$serverUrl/links_feature'));
      expect(getServerUrl('links', suffix: '62624ef08d880f00045d08e6'), equals('$serverUrl/links/62624ef08d880f00045d08e6'));
      expect(() => getServerUrl('links', suffix: '/62624ef08d880f00045d08e6'), throwsA('[getServerUrl] suffix (/62624ef08d880f00045d08e6) starts with "/"'));
    });

    test('getServerUrl - under testing - valid results', () {
      systemUnderTesting = true;
      expect(getServerUrl(''), equals(''));
      expect(getServerUrl(' '), equals(''));
      expect(getServerUrl('links'), equals('$serverUrl/links?test'));
      expect(getServerUrl('Links'), equals('$serverUrl/links?test'));
      expect(getServerUrl('LINKS'), equals('$serverUrl/links?test'));
      expect(getServerUrl('links_feature'), equals('$serverUrl/links_feature?test'));
      // expect(getServerUrl('linksFeature'), equals('$serverUrl/links_feature?test'));
      // expect(getServerUrl('LinksFeature'), equals('$serverUrl/links_feature?test'));
      expect(getServerUrl('links', suffix: '62624ef08d880f00045d08e6'), equals('$serverUrl/links/62624ef08d880f00045d08e6?test'));
      expect(() => getServerUrl('links', suffix: '/62624ef08d880f00045d08e6'), throwsA('[getServerUrl] suffix (/62624ef08d880f00045d08e6) starts with "/"'));
      systemUnderTesting = false;
    });
  });

  group('getSimpleTextFromSpecialContent', () {
    test('getSimpleTextFromSpecialContent - valid results', () {
      expect(getSimpleTextFromSpecialContent(''), equals(''));
      expect(getSimpleTextFromSpecialContent('This is a test...'), equals('This is a test...'));
      expect(getSimpleTextFromSpecialContent('${prefixSpecialContent}mkd${splitOnSpecialContent}This is a test...'), equals('This is a test...'));
      expect(getSimpleTextFromSpecialContent('${prefixSpecialContent}mkdThis is a test...'), equals('${prefixSpecialContent}mkdThis is a test...'));
    });
  });
}
