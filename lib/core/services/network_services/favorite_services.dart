import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:locahub/core/data/config.dart';

class FavoriteServices {
  Future<http.Response> get(String token) async {
    print(token);
    Uri url = Uri.parse(FavoriteConfig.main);
    log(url.toString());
    return await http.get(
      url,
      headers: ApiConfig.tokenHeader(token),
    );
  }

  Future<http.Response> delete(String token, favoriteId) async {
    String endPoint = "${FavoriteConfig.main}/$favoriteId";
    Uri url = Uri.parse(endPoint);
    log(url.toString(), name: "FavoriteService->delete: endPoint");

    return await http.delete(
      url,
      headers: ApiConfig.tokenHeader(token),
    );
  }

  Future<http.Response> add(
    String token,
    int productId,
    // ignore: avoid_init_to_null
  ) async {
    Uri url = Uri.parse(
      FavoriteConfig.main,
    );
    log(url.toString(), name: "FavoriteService->add: productId");

    Map<String, String> body = {
      "products_id": productId.toString(),
    };

    return await http.post(
      url,
      headers: ApiConfig.tokenHeader(token),
      body: jsonEncode(body),
    );
  }
}
