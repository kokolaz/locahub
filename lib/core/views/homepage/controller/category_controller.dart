import 'package:get/get.dart';
import 'package:locahub/core/models/category_model.dart';
import 'dart:convert';

import 'package:locahub/core/models/product_model.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';

import '../../../services/network_services/api_services.dart';

class CategoryController extends GetxController {
  final UserPrefService userPrefService = UserPrefService();
  final _apiServices = ApiService();
  final _isLoading = true.obs;
  final _listCategory = <Kategori>[].obs;
  final _listproducts = <Products>[].obs;
  final _isLoadingproductCategory = true.obs;

  RxList<Products> get productsCategory => _listproducts;
  RxList<Kategori> get category => _listCategory;
  RxBool get isLoading => _isLoading;
  RxBool get isProductCategory => _isLoadingproductCategory;

  Future<void> fetchCategory() async {
    try {
      var response = await _apiServices.get(uri: "category", useToken: true);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var element in data['data']['data']) {
          _listCategory.add(Kategori.fromJson(element));
        }
        _isLoading(false);
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchProductsCategory({id = 0}) async {
    try {
      var response = await _apiServices.get(uri: "products?categories=$id");
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var element in data['data']['data']) {
          _listproducts.add(Products.fromJson(element));
        }
        _isLoadingproductCategory(false);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
    }
  }
}
