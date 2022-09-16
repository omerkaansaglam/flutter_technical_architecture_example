import 'package:intl/intl.dart';

extension DateTimeParser on DateTime {
  String dateToStringParser([String format = 'dd-MM-yyyy']) {
    final f = DateFormat(format);
    return f.format(this);
  }
}

extension StringParser on String {
  DateTime stringToDateParser([String format = 'dd-MM-yyyy']) {
    final f = DateFormat(format);
    return f.parse(this);
  }
}
