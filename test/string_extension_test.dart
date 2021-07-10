import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/extensions/extensions_lib.dart';

void main() {
  group('String extension tests', () {
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
}
