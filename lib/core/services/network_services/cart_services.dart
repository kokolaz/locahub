import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:locahub/core/data/config.dart';

class CartServices {
  Future<http.Response> get(String token) async {
    print(token);
    Uri url = Uri.parse(CartConfig.main);
    log(url.toString());
    return await http.get(
      url,
      headers: ApiConfig.tokenHeader(token),
    );
  }

  Future<http.Response> bulkDelete(String token, List cart) async {
    String endPoint = "${CartConfig.main}/bulk-delete";
    Uri url = Uri.parse(endPoint);
    log(url.toString(), name: "CartService->bulkDelete: endPoint");

    Map<String, String> body = {};

    for (var i = 0; i < cart.length; i++) {
      log(cart[i].toString());
      var tempBody = {
        "cart_ids[$i]": cart[i].toString(),
      };
      body.addAll(tempBody);
    }
    inspect(body);

    return await http.delete(
      url,
      headers: ApiConfig.tokenHeader(token),
      body: jsonEncode(body),
    );
  }

  Future<http.Response> delete(String token, cartId) async {
    String endPoint = "${CartConfig.main}/$cartId";
    Uri url = Uri.parse(endPoint);
    log(url.toString(), name: "CartService->delete: endPoint");

    return await http.delete(
      url,
      headers: ApiConfig.tokenHeader(token),
    );
  }

  Future<http.Response> add(String token, int productId,
      // ignore: avoid_init_to_null
      {int? variationId = null}) async {
    Uri url = Uri.parse(
      CartConfig.main,
    );
    Map<String, String> body = {
      "product_id": productId.toString(),
    };
    if (variationId != null) {
      body = {
        "product_id": productId.toString(),
        "variation_id": variationId.toString(),
      };
    }
    return await http.post(
      url,
      headers: ApiConfig.tokenHeader(token),
      body: jsonEncode(body),
    );
  }

  Future<http.Response> decrease(
    String token,
    int cartId,
  ) async {
    String endPoint = "${CartConfig.main}/$cartId/decrease";

    Uri url = Uri.parse(
      endPoint,
    );
    return await http.patch(
      url,
      headers: ApiConfig.tokenHeader(token),
    );
  }
}
