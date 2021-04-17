class StringHelper {
  static String enumToString(Object raw) {
    try {
      return raw.toString().split(".").last;
    } catch (e) {
      return "error";
    }
  }
}
