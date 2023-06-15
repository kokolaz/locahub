import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:locahub/core/data/config.dart';

class RajaOngkirService {
  Future<http.Response> main(
    String token,
    String courier,
    int addressId,
    List products,
  ) async {
    Uri url = Uri.parse(RajaOngkirConfig.main);
    log(url.toString());
    var body = {
      "address_id": addressId,
      "products": products,
      "courier": courier,
    };
    var jsonBody = jsonEncode(body);
    // log(jsonBody);
    return await http.post(
      url,
      headers: ApiConfig.tokenHeader(token),
      body: jsonBody,
    );
  }
}
