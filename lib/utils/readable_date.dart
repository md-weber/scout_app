import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String format(String format) {
    return readableDate(this, format);
  }
}

String readableDate(DateTime dateTime, String format) {
  if (format.isEmpty) return dateTime.toIso8601String();
  return DateFormat(format).format(dateTime.toLocal());
}
