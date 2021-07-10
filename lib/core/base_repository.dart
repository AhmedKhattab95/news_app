import 'package:http/http.dart' as http;

import 'models/models_lib.dart';

/// base repository class to get data from API
/// dpendant on http package
abstract class BaseRepository {
  Future<ResponseModel> getAsync(String url,
      {Map<String, String>? headers}) async {
    Uri uri = Uri.parse(url.trim());
    var response = await http.get(uri, headers: headers);
    var responseModel =
        ResponseModel(response.statusCode, response.body, response.headers);
    return responseModel;
  }
}
