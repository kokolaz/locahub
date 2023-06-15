import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:locahub/core/data/config.dart';

class ApiService {
  Future<http.Response> get({uri = "", params = "", useToken = false}) async {
    Uri url = Uri.parse("${ApiConfig.api}/$uri");
    if (params != "") {
      url.replace(queryParameters: jsonDecode(params));
    }
    Map<String, String> headers = {};
    if (useToken) {
      headers = await ApiConfig.Headers();
    } else {
      headers = ApiConfig.header;
    }
    var res = await http.get(
      url,
      headers: headers,
    );
    return res;
  }

  Future<http.Response> postData(
      {uri = "", params = "", body = Object, useToken = false}) async {
    Uri url = Uri.parse("${ApiConfig.api}/$uri");
    if (params != "") {
      url.replace(queryParameters: jsonDecode(params));
    }
    Map<String, String> headers = {};
    if (useToken) {
      headers = await ApiConfig.Headers();
    } else {
      headers = ApiConfig.header;
    }
    var res = await http.post(
      url,
      body: body,
      headers: headers,
    );
    print(res.body);
    return res;
  }
}
