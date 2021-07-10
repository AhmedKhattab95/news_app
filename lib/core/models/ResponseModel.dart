import 'package:news_app/core/core_lib.dart';

class ResponseModel {
  final int statusCode;
  final String body;
  final Map<String, String>? headers;

  const ResponseModel(this.statusCode, this.body, this.headers);

  bool hasErrors() {
    if (statusCode >= 300 || statusCode < 200) return true;
    if (body.isNullOrWhiteSpace()) return true;
    return false;
  }
}
