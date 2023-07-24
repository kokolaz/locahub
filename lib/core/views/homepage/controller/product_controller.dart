import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/models/product_detail_model.dart';
import 'dart:convert';

import 'package:locahub/core/models/product_model.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';

import '../../../services/network_services/api_services.dart';

class ProductController extends GetxController {
  final UserPrefService userPrefService = UserPrefService();
  final _apiServices = ApiService();
  final _listproducts = <Products>[].obs;
  final _pageProduct = 1.obs;
  final _isLoading = true.obs;
  final _isLoadingDetail = true.obs;
  final _detailProduct = ProductDetail().obs;
  final _listStoreproduct = <Products>[].obs;
  final _listsearchProduct = <Products>[].obs;

  RxBool get isLoading => _isLoading;
  RxBool get isloadingDetail => _isLoadingDetail;
  ScrollController productScrollController = ScrollController();
  RxList<Products> get products => _listproducts;
  RxList<Products> get productsStore => _listStoreproduct;
  Rx<ProductDetail> get detailProduct => _detailProduct;
  RxInt get pageProduct => _pageProduct;
  RxList<Products> get listsearchResult => _listsearchProduct;

  Future<void> fetchProducts() async {
    try {
      var response = await _apiServices.get(uri: "products");
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var element in data['data']['data']) {
          _listproducts.add(Products.fromJson(element));
        }
        _isLoading.value = false;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchProductsStore({id = ""}) async {
    try {
      _listStoreproduct.clear();
      var response = await _apiServices.get(uri: "products?store_id=$id");
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var element in data['data']['data']) {
          _listStoreproduct.add(Products.fromJson(element));
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> searchProduct({terlaris = ""}) async {
    try {
      var response = await _apiServices.get(uri: "products");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var element in data['data']['data']) {
          _listproducts.add(Products.fromJson(element));
        }
        _isLoading.value = false;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchProductsId({id = ""}) async {
    try {
      var response = await _apiServices.get(uri: "products?id=$id");
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        _detailProduct.value = ProductDetail.fromJson(data['data']);
        _isLoadingDetail.value = false;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e);
    }
  }
}
