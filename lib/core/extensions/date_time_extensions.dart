import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String formatToString(String format) => DateFormat(format).format(this);
}
