import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:locahub/core/models/store_model.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';
import '../../../services/network_services/api_services.dart';

class StoreController extends GetxController {
  final UserPrefService userPrefService = UserPrefService();
  final _apiServices = ApiService();
  final _listStore = <StoreModel>[].obs;
  final _productStore = <Product>[].obs;
  final _isLoading = true.obs;

  RxBool get isLoading => _isLoading;
  ScrollController productScrollController = ScrollController();
  RxList<StoreModel> get listStore => _listStore;
  RxList<Product> get productStore => _productStore;

  Future<void> fetchStore({String? name}) async {
    try {
      var response = await _apiServices.get(uri: "store?name=$name");
      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        _listStore.assignAll(jsonData.map((data) => StoreModel.fromJson(data)));
        _isLoading.value = false;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
    }
  }
}
