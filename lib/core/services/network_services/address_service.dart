import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:locahub/core/data/config.dart';
import 'package:locahub/core/models/address_model.dart';
import 'package:locahub/core/services/network_services/api_services.dart';

class AddressService {
  final ApiService apiService = ApiService();

  // ignore: avoid_init_to_null get by id
  Future<http.Response> get(String token, {int? addressesId}) async {
    String endPoint = AddressConfig.all;
    if (addressesId != null) {
      endPoint += "?id=$addressesId";
    }

    final url = Uri.parse(endPoint);
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // request was successful, do something here
    } else {
      // request failed, handle error here
    }

    return response;
  }

  Future<AddressModel> getAlamatbyUserID(String token, {int? userId}) async {
    final endpoint = userId != null
        ? '${AddressConfig.all}?user_id=$userId'
        : AddressConfig.all;
    final response = await http.get(Uri.parse(endpoint), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json);
      return AddressModel.fromJson(json);
    } else {
      throw Exception('Failed to get address');
    }
  }

  Future<void> add({
    required String token,
    required String userId,
    required String addressLabel,
    required String name,
    required String phoneNumber,
    required String address,
    required String detailAddress,
    required String completeAddress,
    required int postcode,
    required String district,
    required int cityId,
    required int provinceId,
  }) async {
    final url = Uri.parse(AddressConfig.add);
    final body = {
      'user_id': userId,
      'address_label': addressLabel,
      'name': name,
      'phone_number': phoneNumber,
      'address': address,
      'address_detail': detailAddress,
      'complete_address': completeAddress,
      'postcode': postcode.toString(),
      'district': district,
      'city_id': cityId.toString(),
      'province_id': provinceId.toString(),
      'choice': 0,
    };

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print(response.body);
      // request was successful, do something here
    } else {
      print(response.statusCode);
      print("object");
      print(response.body);
      // request failed, handle error here
    }
  }
}
