import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/core/core_lib.dart';

void main() {
  group('isNullOrWhiteSpace String extension tests', () {
    test('return true if string is empty', () {
      String out = '';
      expect(out.isNullOrWhiteSpace(), true);
    });
    test('return true if string is white space', () {
      String out = '   ';
      expect(out.isNullOrWhiteSpace(), true);
    });
    test('return true if string is null string', () {
      String out = 'null';
      expect(out.isNullOrWhiteSpace(), true);
    });
    test('return true if string is null string with white space', () {
      String out = ' null ';
      expect(out.isNullOrWhiteSpace(), true);
    });
    test('return false if string is contain value', () {
      String out = 'this message came from any where';
      expect(out.isNullOrWhiteSpace(), false);
    });
  });

  group('captalize String extension tests', () {
    test('not throw exception if empty', () {
      String out = '';
      expect(out.captalize(), '');
    });
  });
}
