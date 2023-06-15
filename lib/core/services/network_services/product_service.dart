import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:locahub/core/data/config.dart';

class ProductServices {
  Future<http.Response> get(String token) async {
    Uri url = Uri.parse(ProductConfig.main);
    log(url.toString());
    return await http.get(
      url,
      headers: ApiConfig.tokenHeader(token),
    );
  }
}
