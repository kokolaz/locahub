import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/models/transaction_model.dart';
import 'package:locahub/core/services/network_services/transaction_service.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';
import 'package:http/http.dart' as http;

class TransactionIndexController extends GetxController {
  final UserPrefService userPrefService = UserPrefService();
  final TransactionService transactionService = TransactionService();
  final RxBool isLoading = true.obs;
  final RxList status = [
    "Belum Bayar",
    "Menunggu Konfirmasi",
    // "Dikemas",
    "Dikirim",
    "Selesai",
    "Dibatalkan",
  ].obs;
  final RxList statusParam = [
    'menunggu_pembayaran',
    'menunggu_konfirmasi',
    // 'diproses',
    'dikirim',
    'selesai',
    'dibatalkan',
    'expired',
  ].obs;
  final RxString selectedStatus = "Belum Bayar".obs;
  final RxString selectedStatusParam = "menunggu_pembayaran".obs;
  final RxInt page = 1.obs;
  final ScrollController scrollController = ScrollController();
  final RxBool addingData = false.obs;
  final RxBool loadingData = true.obs;
  final RxList transactions = [].obs;
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    userPrefService.initUserPref();
    fetchTransactionIndex().then((_) {
      isLoading.value = false;
      isLoading.refresh();
    });
    scrollController.addListener(() {
      log(scrollController.position.maxScrollExtent.toString());
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        fetchTransactionIndex();
      }
    });
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }

  fetchTransactionIndex() async {
    addingData.value = true;
    addingData.refresh();
    String? token = userPrefService.readToken();
    if (token != null) {
      await transactionService
          .getIndex(token, page.value, status: selectedStatusParam.value)
          .then((value) {
        if (value.statusCode == 200) {
          log("200",
              name:
                  "TransactionIndexController->fetchTransactionIndex: getIndex()");
          log(selectedStatusParam.value, name: "Status Parm");
          var jsonData = jsonDecode(value.body);
          if (jsonData["transactions"]["data"].isNotEmpty) {
            transactions.addAll(jsonData["transactions"]["data"]);
            inspect(transactions);
            page.value += 1;
            page.refresh();
          }
          loadingData.value = false;
          loadingData.refresh();
          addingData.value = false;
          addingData.refresh();
        } else {
          log("err",
              name:
                  "TransactionIndexController->fetchTransactionIndex: getIndex()");
        }
      });
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Oops!",
          message:
              "Untuk melihat daftar transaksi harap untuk login terlebih dahulu",
        ),
      );
    }
  }

  Future<TransactionModel> fetchTransaction({int? idTransaksi}) async {
    String? token = userPrefService.readToken();

    var url = Uri.parse('http://locahub.my.id/api/transaction/$idTransaksi');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var transactionModel = TransactionModel.fromJson(jsonResponse);
      return transactionModel;
    } else {
      throw Exception('Failed to load transaction');
    }
  }
}
