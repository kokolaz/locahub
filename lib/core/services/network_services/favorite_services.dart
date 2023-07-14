import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:locahub/core/data/config.dart';
import 'package:locahub/core/models/favorite_model.dart';

class FavoriteServices {
  Future<List<FavoriteModel>> fetchFavoriteModels(
      String token, int userId) async {
    Uri url = Uri.parse("${FavoriteConfig.main}/$userId");
    final response = await http.get(
      url,
      headers: ApiConfig.tokenHeader(token),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((data) => FavoriteModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch favorite models');
    }
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

  Future<http.Response> add(String token, int productId, int userId
      // ignore: avoid_init_to_null
      ) async {
    Uri url = Uri.parse(
      FavoriteConfig.main,
    );
    log(url.toString(), name: "FavoriteService->add: productId");

    Map<String, String> body = {
      "products_id": productId.toString(),
      "user_id": userId.toString(),
    };

    return await http.post(
      url,
      headers: ApiConfig.tokenHeader(token),
      body: jsonEncode(body),
    );
  }
}
