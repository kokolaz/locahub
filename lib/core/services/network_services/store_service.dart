import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:locahub/core/data/config.dart';
import 'package:locahub/core/models/store_model.dart';

class StoreServices {
  Future<List<StoreModel>> fetchStoreDetails(
    String token,
    String name,
  ) async {
    Uri url = Uri.parse("${StoreConfig.main}?name=$name");
    final response = await http.get(
      url,
      headers: ApiConfig.tokenHeader(token),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      print(jsonData);
      return jsonData.map((data) => StoreModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch favorite models');
    }
  }
}
