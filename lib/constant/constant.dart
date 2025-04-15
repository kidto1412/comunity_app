class Constant {
  static const String baseUrl = "http://localhost:3000";

  static Uri getUri(String path) => Uri.parse('$baseUrl$path');
}
