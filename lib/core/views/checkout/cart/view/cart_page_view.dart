import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locahub/core/views/checkout/cart/controller/cart_controller.dart';
import 'package:locahub/core/views/global/my_button.dart';
import 'package:locahub/core/views/global/theme.dart';

class CartPageView extends GetView<CartController> {
  final MyButton _myButton = MyButton();

  CartPageView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartController());
    return Scaffold(
      backgroundColor: whiteColor,
      body: Obx(() {
        return controller.isLoading.value != true
            ? _content(context)
            : _loading();
      }),
    );
  }

  Widget _content(context) {
    return SizedBox(
        height: Get.height,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 21),
                      decoration: BoxDecoration(
                        color: whiteColor,
                      ),
                      child: Text(
                        "Keranjang Belanja",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: darkColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 27.95,
                  top: 24,
                  child: InkWell(
                    onTap: () {},
                    child: SizedBox(
                      height: 18,
                      width: 18,
                      child: Icon(
                        FontAwesomeIcons.chevronLeft,
                        size: 13.33,
                        color: textmutedColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: controller.cart.isNotEmpty
                  ? cartExist()
                  : const Center(
                      child: Text("Belum ada barang dikeranjangmu!"),
                    ),
            ),
          ],
        ));
  }

  Widget _loading() {
    return SizedBox(
      height: Get.height,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget cartExist() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < controller.cart.length; i++)
                Column(
                  children: [
                    Divider(
                      thickness: 9,
                      color: lightgreyColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Obx(() {
                            return Checkbox(
                              value: controller.checkedCart[i]["checked"],
                              checkColor: whiteColor,
                              activeColor: orangeColor,
                              onChanged: (value) {
                                controller.checkStore(i);
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            );
                          }),
                          Text(
                            controller.cart[i]["name"],
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: darkColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Divider(
                        thickness: 1,
                        color: lightgreyColor,
                      ),
                    ),
                    for (var j = 0; j < controller.cart[i]["carts"].length; j++)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 24, 0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(() {
                                  return Checkbox(
                                    value: controller.checkedCart[i]["items"][j]
                                        ["checked"],
                                    // value: controller.item[i]["store"]["item"][j]["is_checked"],
                                    checkColor: whiteColor,
                                    activeColor: orangeColor,
                                    onChanged: (value) {
                                      controller.checkItem(i, j);
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  );
                                }),
                                Container(
                                  height: 76,
                                  width: 76,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: orangeColor,
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: controller
                                              .cart[i]["carts"][j]["product"]
                                                  ["galleries"]
                                              .isNotEmpty
                                          ? Image.network(
                                              controller.cart[i]["carts"][j]
                                                      ["product"]["galleries"]
                                                  [0]["url"],
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return const Center(
                                                  child: Text(
                                                      "Gambar tidak ditemukan"),
                                                );
                                              },
                                            )
                                          : const Center(
                                              child: Text("Tidak ada gambar"),
                                            )

                                      // controller.cart[i]["carts"][j]["image"] != null
                                      //     ? Image.network(
                                      //         controller.cart[i]["carts"][j]["image"],
                                      //       )
                                      //     : Image.network(
                                      //         "https://s0.bukalapak.com/attachment/512332/manfaat_kopi_main_image.jpg",
                                      //         fit: BoxFit.fill,
                                      //       ),
                                      ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Obx(() {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.cart[i]["carts"][j]
                                              ["product"]["name"],
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: darkColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        controller.cart[i]["carts"][j]
                                                    ["variation"] !=
                                                null
                                            ? Column(
                                                children: [
                                                  Text.rich(
                                                    TextSpan(
                                                      text:
                                                          "Variasi: ${controller.cart[i]["carts"][j]["variation"]["name"]}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        color: textmutedColor,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              )
                                            : const SizedBox(),
                                        Text.rich(
                                          TextSpan(
                                            text: controller.cart[i]["carts"][j]
                                                        ["variation"] !=
                                                    null
                                                ? NumberFormat.currency(
                                                    locale: "id_ID",
                                                    name: "IDR",
                                                    symbol: "Rp. ",
                                                    decimalDigits: 0,
                                                  ).format(
                                                    int.tryParse(controller
                                                                        .cart[i]
                                                                    ["carts"][j]
                                                                ["variation"][
                                                            "products_price"]) ??
                                                        0,
                                                  )
                                                : NumberFormat.currency(
                                                    locale: "id_ID",
                                                    name: "IDR",
                                                    symbol: "Rp. ",
                                                    decimalDigits: 0,
                                                  ).format(controller.cart[i]
                                                        ["carts"][j]["product"]
                                                    ["price"]),
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              color: darkColor,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 14,
                                        ),
                                        Container(
                                          height: 50,
                                          width: 114,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: lightgreyColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  controller.decreaseItem(
                                                    int.parse(controller.cart[i]
                                                            ["carts"][j]
                                                            ["quantity"]
                                                        .toString()),
                                                    i,
                                                    j,
                                                    controller.checkedCart[i]
                                                        ["items"][j]["cart_id"],
                                                  );
                                                },
                                                child: Container(
                                                  height: 31,
                                                  width: 31,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: greyColor,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "-",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 20,
                                                        color: darkColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "${controller.cart[i]["carts"][j]["quantity"]}",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: darkColor,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controller.increaseItem(
                                                    int.parse(controller.cart[i]
                                                            ["carts"][j]
                                                            ["quantity"]
                                                        .toString()),
                                                    i,
                                                    j,
                                                    int.parse(controller
                                                        .checkedCart[i]["items"]
                                                            [j]["product_id"]
                                                        .toString()),
                                                    controller.checkedCart[i]
                                                            ["items"][j]
                                                        ["variation_id"],
                                                  );
                                                },
                                                child: Container(
                                                  height: 31,
                                                  width: 31,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: orangeColor,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "+",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 20,
                                                        color: darkColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              const SizedBox(
                height: 110,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 18,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Container(
              width: Get.width - 48,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0,
                    blurRadius: 20,
                    color: Colors.black.withAlpha(51),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Belanja",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: darkColor,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(() {
                        return Text(
                          NumberFormat.currency(
                                  locale: "id_ID",
                                  name: "Rupiah",
                                  symbol: "Rp. ",
                                  decimalDigits: 0)
                              .format(controller.subTotal()),
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: orangeColor,
                          ),
                        );
                      }),
                    ],
                  ),
                  _myButton.btn(
                    "Lanjutkan",
                    func: () {
                      controller.checkCart();
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
