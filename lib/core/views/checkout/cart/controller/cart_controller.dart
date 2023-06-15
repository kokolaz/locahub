// ignore_for_file: unnecessary_overrides

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:locahub/core/services/network_services/cart_services.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';
import 'package:locahub/core/views/checkout/checkout_2/view/checkout_2_view.dart';

class CartController extends GetxController {
  final UserPrefService userPrefService = UserPrefService();
  final CartServices cartServices = CartServices();
  final RxBool isLoading = true.obs;
  RxList checkedCart = [].obs;
  RxList selectedItem = [].obs;
  RxList cart = [].obs;
  RxList item = [
    {
      "store": {
        "id": 1,
        "name": "Kios Kopi Floratama",
        "is_checked": true,
        "item": [
          {
            "id": 1,
            "name": "Otten Coffee - Flores Manggarai Kopi Arabica",
            "qty": 1,
            "image": "assets/images/product/floresmanggarai.png",
            "is_checked": false,
            "variant": {
              "id": 1,
              "name": "Kemasan 500gr",
            },
            "price": int.parse("160000"),
            "discount_price": int.parse("150000"),
          },
          {
            "id": 2,
            "name": "Otten Coffee - Flores Manggarai Kopi Robusta",
            "qty": 1,
            "image": "assets/images/product/floresmanggarai.png",
            "is_checked": true,
            "variant": {
              "id": 1,
              "name": "Kemasan 500gr",
            },
            "price": int.parse("120000"),
            "discount_price": null,
          },
        ]
      },
    },
    {
      "store": {
        "id": 2,
        "name": "Toko Senang",
        "is_checked": true,
        "item": [
          {
            "id": 1,
            "name": "Teh Celup Organik 50gr",
            "qty": 1,
            "image": "assets/images/product/tehcelup.png",
            "is_checked": true,
            "variant": null,
            "price": int.parse("16000"),
            "discount_price": null,
          },
        ]
      },
    },
  ].obs;

  @override
  void onInit() {
    userPrefService.userPref.initStorage;
    fetchCart().then((_) {
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

  fetchCart() async {
    String? token = userPrefService.readToken();
    if (token != null) {
      await cartServices.get(token).then((value) {
        if (value.statusCode == 200) {
          log("200", name: "CartController->onReady->getCart");
          var jsonData = jsonDecode(value.body);
          List tempCart = jsonData["cart_stores"];
          if (tempCart.isNotEmpty) {
            cart.addAll(tempCart);
            cart.refresh();
            // inspect(cart);
          }
          // ignore: avoid_function_literals_in_foreach_calls
          cart.forEach(
            (element) {
              // inspect(element);
              List items = [];
              element["carts"].forEach((elc) {
                items.add({
                  "cart_id": elc["id"],
                  "product_id": elc["product_id"],
                  "product_name": elc["product"]["name"],
                  // ignore: unnecessary_null_in_if_null_operators
                  "variation_id": elc["variation_id"] ?? null,
                  "variation_name": elc["variation"] != null
                      ? elc["variation"]["name"]
                      : null,
                  "price": elc["variation"] != null
                      ? elc["variation"]["products_price"]
                      : elc["product"]["price"],
                  "img_url": elc["product"]["galleries"].isNotEmpty
                      ? elc["product"]["galleries"][0]["url"]
                      : null,
                  "qty": elc["quantity"],
                  "checked": true,
                });
              });

              checkedCart.add({
                "id": element["id"],
                "store_name": element["name"],
                "checked": true,
                "items": items,
              });
            },
          );
        } else {
          log("err", name: "CartController->onReady->getCart");
        }
        checkedCart.refresh();
      });
    }
  }

  checkItem(int i, int j) {
    checkedCart[i]["items"][j]["checked"] =
        !checkedCart[i]["items"][j]["checked"];
    checkedCart.refresh();
    if (checkedCart[i]["items"][j]["checked"] == true) {
      selectedItem.add(checkedCart[i]["items"][j]);
      selectedItem.refresh();
      checkedCart[i]["cheked"] = true;
      checkedCart.refresh();
    } else {
      selectedItem.removeWhere((element) =>
          element["cart_id"] == checkedCart[i]["items"][j]["cart_id"]);
      selectedItem.refresh();
    }
  }

  checkStore(int i) {
    checkedCart[i]["checked"] = !checkedCart[i]["checked"];
    checkedCart.refresh();

    for (var j = 0; j < checkedCart[i]["items"].length; j++) {
      checkedCart[i]["items"][j]["checked"] = checkedCart[i]["checked"];
    }

    checkedCart.refresh();
  }

  increaseItem(
    int qty,
    int i,
    int j,
    int productId,
    int? variationId,
  ) async {
    String? token = userPrefService.readToken();
    if (token != null) {
      await CartServices()
          .add(
        token,
        productId,
        // ignore: unnecessary_null_in_if_null_operators
        variationId: variationId ?? null,
      )
          .then((value) {
        if (value.statusCode == 200) {
          cart[i]["carts"][j]["quantity"] = qty + 1;
          cart.refresh();
          checkedCart[i]["items"][j]["qty"] = qty + 1;
          checkedCart.refresh();
        }
      });
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Oops!",
          message: "Anda harus login untuk melihat keranjang",
        ),
      );
    }
  }

  decreaseItem(
    int qty,
    int i,
    int j,
    int cartId,
  ) async {
    if (qty > 1) {
      String? token = userPrefService.readToken();
      if (token != null) {
        await CartServices()
            .decrease(
          token,
          cartId,
        )
            .then((value) {
          if (value.statusCode == 200) {
            // log(value.body);
            cart[i]["carts"][j]["quantity"] = qty - 1;
            cart.refresh();

            checkedCart[i]["items"][j]["qty"] = qty - 1;
            checkedCart.refresh();
          }
        });
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            title: "Oops!",
            message: "Anda harus login untuk melihat keranjang",
          ),
        );
      }
    }
  }

  int subTotal() {
    // ignore: no_leading_underscores_for_local_identifiers
    var _temp = 0;
    // ignore: avoid_function_literals_in_foreach_calls
    checkedCart.forEach((i) {
      i["items"].forEach((j) {
        if (j["checked"] == true) {
          int x = (int.tryParse(j["qty"].toString()) ?? 0) *
              (int.tryParse(j["price"].toString()) ?? 0);
          _temp += x;
        }
      });
    });

    return _temp;
  }

  checkCart() {
    var x = checkedCart.where((p0) => p0["checked"] == true).toList();
    var selectedCart = [];
    for (var i = 0; i < x.length; i++) {
      // inspect(x[i]);
      selectedCart.add({
        "store_id": x[i]["id"],
        "store_name": x[i]["store_name"],
        "selected_courier": "",
        "loading_courier_service": false,
        "courier_services": [],
        "selected_courier_service": {},
        "items": [],
      });
      for (var j in x[i]["items"]) {
        if (j["checked"] == true) {
          selectedCart[i]["items"].add(j);
        }
      }
    }

    // inspect(selectedCart);
    Get.to(
      () => const Checkout2View(),
      arguments: selectedCart,
    )!
        .then((_) {
      selectedItem.clear();
      cart.clear();
      checkedCart.clear();
      isLoading.value = true;
      isLoading.refresh();
      fetchCart().then((_) {
        isLoading.value = false;
        isLoading.refresh();
      });
    });
  }
}
