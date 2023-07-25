// ignore_for_file: unnecessary_overrides

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locahub/core/services/network_services/address_service.dart';
import 'package:locahub/core/services/network_services/cart_services.dart';
import 'package:locahub/core/services/network_services/raja_ongkir_service.dart';
import 'package:locahub/core/services/network_services/transaction_service.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';
import 'package:locahub/core/views/checkout/snap/view/snap_view.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/transaction_index/view/transaction_index_view.dart';

class Checkout2Controller extends GetxController {
  final UserPrefService userPrefService = UserPrefService();
  final AddressService addressService = AddressService();
  final RajaOngkirService rajaOngkirService = RajaOngkirService();
  final TransactionService transactionService = TransactionService();
  final CartServices cartServices = CartServices();
  final RxBool isLoading = true.obs;
  final RxMap user = {}.obs;
  final RxList addresses = [].obs;
  final RxList courier = [
    "jne",
    "tiki",
    "pos",
  ].obs;
  final RxList selectedProducts = [].obs;
  final RxInt totalPriceItem = 0.obs;
  @override
  void onInit() async {
    selectedProducts.value = Get.arguments;
    selectedProducts.refresh();
    inspect(selectedProducts);
    countTotalPriceItem();

    userPrefService.initUserPref();
    await fetchAddresses().then((_) {
      isLoading.value = false;
      isLoading.refresh();
    });
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  fetchAddresses() async {
    String? token = userPrefService.readToken();
    if (token != null) {
      await addressService.get(token).then((value) {
        if (value.statusCode == 200) {
          var jsonData = jsonDecode(value.body);
          addresses.addAll(jsonData["data"]["address"]["data"]);
          addresses.refresh();
        } else {
          log("failed", name: "Checkout2Controller->fetchAddresses");
        }
      });
    }
  }

  fetchRajaOngkir(int i) async {
    String? token = userPrefService.readToken();
    selectedProducts[i]["courier_services"].clear();
    selectedProducts.refresh();
    List product = [];
    for (var x in selectedProducts[i]["items"]) {
      var tempData = {
        "product_id": x["product_id"],
        "quantity": x["qty"],
      };
      product.add(tempData);
    }

    if (token != null) {
      await rajaOngkirService
          .main(
        token,
        selectedProducts[i]["selected_courier"],
        addresses.first["id"],
        product,
      )
          .then((value) {
        if (value.statusCode == 200) {
          log("success", name: "Checkout2Controller->fetchRajaOngkir");

          var jsonData = jsonDecode(value.body);
          if (selectedProducts[i] == null ||
              selectedProducts[i]["courier_services"] == null ||
              jsonData == null ||
              jsonData["response"] == null ||
              jsonData["response"]["rajaongkir"] == null ||
              jsonData["response"]["rajaongkir"]["results"] == null ||
              jsonData["response"]["rajaongkir"]["results"][0] == null ||
              jsonData["response"]["rajaongkir"]["results"][0]["costs"] ==
                  null) {
            log("Error: Some data is null",
                name: "Checkout2Controller->fetchRajaOngkir");
            return;
          }

          selectedProducts[i]["courier_services"].addAll(
              jsonData["response"]["rajaongkir"]["results"][0]["costs"]);
          selectedProducts.refresh();
        } else {
          log("failed", name: "Checkout2Controller->fetchRajaOngkir");
        }
      });
    }

    selectedProducts[i]["loading_courier_service"] = false;
    selectedProducts.refresh();
  }

  courierDialog02(int i) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          constraints: BoxConstraints(maxHeight: Get.height * 0.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Pilih Jasa Pengiriman",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              for (int j = 0; j < courier.length; j++)
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectedProducts[i]["selected_courier_service"] = {};
                        selectedProducts[i]["selected_courier"] = courier[j];
                        selectedProducts[i]["loading_courier_service"] = true;
                        selectedProducts.refresh();
                        fetchRajaOngkir(i);

                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: orangeColor,
                        ),
                        child: Row(
                          children: [
                            Text(
                              courier[j].toUpperCase(),
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    j == courier.length - 1
                        ? const SizedBox()
                        : const SizedBox(
                            height: 5,
                          ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  cd2(int k) {
    Get.bottomSheet(
      Obx(
        () {
          return selectedProducts[k]["selected_courier"] != ""
              ? selectedProducts[k]["loading_courier_service"] != true
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Pilih Layanan Pengiriman ${selectedProducts[k]["selected_courier"].toUpperCase()}",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          for (int j = 0;
                              j <
                                  selectedProducts[k]["courier_services"]
                                      .length;
                              j++)
                            SizedBox(
                              width: Get.width,
                              child: GestureDetector(
                                onTap: () {
                                  selectedProducts[k]
                                          ["selected_courier_service"] =
                                      selectedProducts[k]["courier_services"]
                                          [j];
                                  selectedProducts.refresh();
                                  Get.back();
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "${selectedProducts[k]["courier_services"][j]["service"]}",
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              symbol: "Rp. ", decimalDigits: 0)
                                          .format(
                                        selectedProducts[k]["courier_services"]
                                            [j]["cost"][0]["value"],
                                      ),
                                      // "${courierService[i]["cost"][0]["value"]}",
                                    ),
                                    Text(
                                      "Estimasi pengiriman ${selectedProducts[k]["courier_services"][j]["cost"][0]["etd"]} hari",
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
              : Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Pilih Jasa Pengiriman",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      for (int j = 0; j < courier.length; j++)
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                selectedProducts[k]
                                    ["selected_courier_service"] = {};
                                selectedProducts[k]["selected_courier"] =
                                    courier[j];
                                selectedProducts[k]["loading_courier_service"] =
                                    true;
                                selectedProducts.refresh();
                                fetchRajaOngkir(k);

                                // Get.back();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: orangeColor,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      courier[j].toUpperCase(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            j == courier.length - 1
                                ? const SizedBox()
                                : const SizedBox(
                                    height: 5,
                                  ),
                          ],
                        ),
                    ],
                  ),
                );
        },
      ),
    );
  }

  countTotalPriceItem() {
    var tempitemTotalPrice = 0;
    for (var i in selectedProducts) {
      i["items"].forEach((j) {
        int tempItemPrice = (j["price"]);
        int tempItemQty = int.tryParse(j["qty"].toString()) ?? 0;
        int tempSubTotal = tempItemPrice * tempItemQty;
        tempitemTotalPrice += tempSubTotal;
      });
    }
    totalPriceItem.value = tempitemTotalPrice;
    totalPriceItem.refresh();
  }

  bool checkCourier() {
    int tempRes = selectedProducts.indexWhere(
        (element) => element["selected_courier_service"]["service"] == null);
    log(tempRes.toString());
    bool result = false;
    if (tempRes == -1) {
      result = true;
    } else if (tempRes > -1) {
      result = false;
    }
    return result;
  }

  countTotalShipmentPrice() {
    int tempShipmentPrice = 0;
    for (var element in selectedProducts) {
      if (element["selected_courier_service"]["cost"] != null) {
        tempShipmentPrice += int.parse(
            element["selected_courier_service"]["cost"][0]["value"].toString());
      }
    }
    return tempShipmentPrice;
  }

  int countTotal() {
    int tempShipmentPrice = countTotalShipmentPrice();

    return totalPriceItem.value + tempShipmentPrice;
  }

  pay() async {
    String? token = userPrefService.readToken();
    if (token != null) {
      var products = [];
      var shippings = [];
      for (var i in selectedProducts) {
        for (var j in i["items"]) {
          products.add({
            "product_id": j["product_id"],
            "quantity": j["qty"],
            // ignore: unnecessary_null_in_if_null_operators
            "variation_id": j["variation_id"] ?? null,
          });
        }
        shippings.add({
          "store_id": i["store_id"],
          "code": i["selected_courier"],
          "service": i["selected_courier_service"]["service"],
        });
      }
      await transactionService
          .store(token, addresses.first["id"], products, shippings)
          .then((value) {
        if (value.statusCode == 200) {
          log("200", name: "Checkout2Controller->pay");
          var jsonData = jsonDecode(value.body);
          List cartsId = [];
          // ignore: avoid_function_literals_in_foreach_calls
          selectedProducts.forEach((iElement) {
            iElement["items"].forEach((jElement) {
              cartsId.add(jElement["cart_id"]);
            });
          });

          for (var element in cartsId) {
            log(element.toString());
            cartServices.delete(token, element);
          }
          // inspect(jsonData);
          Get.off(
            () => const SnapView(),
            arguments: jsonData["transaction"]["snap_token"],
          )!
              .then((_) {
            Get.to(() {
              return const TransactionIndexView();
            });
          });
          // Ges
        } else {
          log("fail", name: "Checkout2Controller->pay");
          var jsonBody = jsonDecode(value.body);
          inspect(jsonBody);
        }
      });
    }
  }
}
