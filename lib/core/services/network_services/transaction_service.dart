import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:locahub/core/data/config.dart';

class TransactionService {
  Future<http.Response> store(
    String token,
    int addressId,
    List products,
    List shippings,
  ) async {
    log(token);
    String endPoint = TransactionConfig.main;
    log(endPoint, name: "TransactionService->store: endPoint");
    var body = {
      "address_id": addressId,
      "note": "",
      "products": products,
      "shippings": shippings,
    };
    log(body.toString());
    inspect(body);
    Uri url = Uri.parse(endPoint);
    return await http.post(
      url,
      headers: ApiConfig.tokenHeader(token),
      body: jsonEncode(body),
    );
  }

  Future<http.Response> getIndex(
    String token,
    int page, {
    int limit = 10,
    String keyword = "",
    String status = "menunggu_pembayaran",
  }) async {
    String endPoint = "${TransactionConfig.main}?limit=$limit";
    if (keyword != "") {
      endPoint += "&keyword=$keyword";
    }

    endPoint += "&status=$status";

    endPoint += "&page=$page";
    log(endPoint, name: "TransactionService->getIndex: endPoint");
    Uri url = Uri.parse(endPoint);

    return await http.get(
      url,
      headers: ApiConfig.tokenHeader(token),
    );
  }
}
