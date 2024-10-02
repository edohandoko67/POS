class Log {
  static void d(dynamic text) => print("\x1B[34m$text\x1B[0m");
  static void e(dynamic text) => print("\x1B[31m$text\x1B[0m");
  static void i(dynamic text) => print("\x1B[33m$text\x1B[0m");
}