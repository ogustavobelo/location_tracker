import 'package:intl/intl.dart';

class StringHelper {
  static String enumToString(Object raw) {
    try {
      return raw.toString().split(".").last;
    } catch (e) {
      return "error";
    }
  }

  static String dateToString(DateTime date, {String format = 'dd/MM/yyyy'}) {
    return DateFormat(format).format(date);
  }
}
