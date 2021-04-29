import 'package:intl/intl.dart';
import 'dart:math' as math;

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

  static String uId() {
    return (s4() +
        s4() +
        '-' +
        s4() +
        '-' +
        s4() +
        '-' +
        s4() +
        '-' +
        s4() +
        s4() +
        s4());
  }

  static String s4() {
    var rnd = math.Random();
    return ((1 + rnd.nextInt(1000)) * 0x10000).floor().toString().substring(1);
  }
}
