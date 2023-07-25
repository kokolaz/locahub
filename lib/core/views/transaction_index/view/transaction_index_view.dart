import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;
import 'package:locahub/core/views/checkout/snap/view/snap_view.dart';
import 'package:locahub/core/views/global/my_button.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/order/view/not_yet_paid.dart';
import 'package:locahub/core/views/transaction_index/controller/transaction_index_controller.dart';

class TransactionIndexView extends GetView<TransactionIndexController> {
  const TransactionIndexView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TransactionIndexController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return _loading(); // return widget loading
              } else {
                return _content(); // return widget content
              }
              // return int.tryParse(controller.isLoading.value != true ? _content() : _loading());
            }),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return SizedBox(
      height: Get.height,
      child: Column(
        children: [
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
                      "Pesanan Saya ",
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
                  onTap: () {
                    Get.back();
                  },
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
          _statusWidget(),
          Divider(
            thickness: 9,
            height: 9,
            color: lightgreyColor,
          ),
          Expanded(
            child: controller.loadingData.value != true
                ? controller.transactions.isNotEmpty
                    ? _transactionWidget()
                    : const Center(
                        child: Text("Tidak ada data"),
                      )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _transactionWidget() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          for (int i = 0; i < controller.transactions.length; i++)
            Column(
              children: [
                // Text("TRANSACTION"),
                Column(
                  children: [
                    for (int j = 0;
                        j <
                            controller
                                .transactions[i]["store_transactions"].length;
                        j++)
                      for (int k = 0;
                          k <
                              controller
                                  .transactions[i]["store_transactions"][j]
                                      ["items"]
                                  .length;
                          k++)
                        GestureDetector(
                          onTap: () {
                            //menu belum bayar
                            // if (controller.transactions[i]["payment_status"] ==
                            //     "menunggu_pembayaran") {
                            //   print(
                            //       "Invoice : ${controller.transactions[i]["code"]}"); //invoice
                            //   print(
                            //       "Time Order : ${controller.transactions[i]["updated_at"]}"); //time order
                            //   print(
                            //       "Store : ${controller.transactions[i]["store_transactions"][j]["store"]["name"]}");
                            //   print(
                            //       "Kurir : ${controller.transactions[i]["store_transactions"][j]["courier"]}");
                            //   print(
                            //       "Image : ${controller.transactions[i]["store_transactions"][j]["items"][k]["product"]["galleries"][0]["url"]}");
                            //   print(
                            //       "Price : ${controller.transactions[i]["store_transactions"][j]["items"][k]["price"]}");
                            //   print(
                            //       "Produk Name : ${controller.transactions[i]["store_transactions"][j]["items"][k]["product"]["name"]}");
                            //   print(
                            //       "Quantity : ${controller.transactions[i]["store_transactions"][j]["items"][k]["quantity"]}");
                            //   print("Alamat");
                            //   print(
                            //       "Status : ${controller.transactions[i]["payment_status"]}");
                            Get.to(() {
                              return NotYetPaid(
                                status: controller.transactions[i]
                                    ["payment_status"],
                                courier: controller.transactions[i]
                                    ["store_transactions"][j]["courier"],
                                costCourier: controller.transactions[i]
                                    ["store_transactions"][j]["shipping_cost"],
                                invoice: controller.transactions[i]["code"],
                                price: controller.transactions[i]
                                        ["store_transactions"][j]["items"][k]
                                    ["price"],
                                storeName: controller.transactions[i]
                                    ["store_transactions"][j]["store"]["name"],
                                productName: controller.transactions[i]
                                        ["store_transactions"][j]["items"][k]
                                    ["product"]["name"],
                                quantity: controller.transactions[i]
                                        ["store_transactions"][j]["items"][k]
                                    ["quantity"],
                                timeOrder: controller.transactions[i]
                                    ["updated_at"],
                                alamat: "Alamat",
                                image: controller.transactions[i]
                                        ["store_transactions"][j]["items"][k]
                                    ["product"]["galleries"][0]["url"],
                                addressStore: controller.transactions[i]
                                        ["store_transactions"][j]["store"]
                                    ["addres"],
                                resi: controller.transactions[i]
                                    ["store_transactions"][j]["receipt"],
                                shippingService: controller.transactions[i]
                                        ["store_transactions"][j]
                                    ["shipping_service"],
                              );
                            });
                            // }
                            print(
                                "Status : ${controller.transactions[i]["payment_status"]}");
                            print("disini klik");
                          },
                          child: Column(
                            children: [
                              j ==
                                      controller
                                              .transactions[i]
                                                  ["store_transactions"]
                                              .length -
                                          1
                                  ? const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 24),
                                      child: Divider(
                                        height: 1,
                                      ),
                                    )
                                  : const SizedBox(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.transactions[i]
                                              ["store_transactions"][j]["store"]
                                          ["name"],
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: orangeColor,
                                      ),
                                    ),
                                    Text(
                                      intl.DateFormat("dd MMMM yyyy HH:mm")
                                          .format(
                                        DateTime.parse(
                                          controller.transactions[i]
                                              ["updated_at"],
                                        ),
                                      ),
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: darkColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Divider(
                                  height: 1,
                                ),
                              ),
                              Column(
                                children: [
                                  for (int k = 0;
                                      k <
                                          controller
                                              .transactions[i]
                                                  ["store_transactions"][j]
                                                  ["items"]
                                              .length;
                                      k++)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 14),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 76,
                                            width: 76,
                                            decoration: BoxDecoration(
                                              color: orangeColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: controller
                                                        .transactions[i][
                                                            "store_transactions"]
                                                            [j]["items"][k]
                                                            ["product"]
                                                            ["galleries"]
                                                        .isNotEmpty
                                                    ? Image.network(
                                                        controller.transactions[
                                                                            i][
                                                                        "store_transactions"]
                                                                    [j]["items"]
                                                                [k]["product"][
                                                            "galleries"][0]["url"],
                                                        errorBuilder: (context,
                                                            error, stackTrace) {
                                                          return const Center(
                                                            child: Text(
                                                                "Gambar tidak ditemukan"),
                                                          );
                                                        },
                                                      )
                                                    : const Center(
                                                        child: Text(
                                                            "Tidak ada gambar"),
                                                      )),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.transactions[i][
                                                              "store_transactions"]
                                                          [j]["items"][k]
                                                      ["product"]["name"],
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: darkColor,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      intl.NumberFormat
                                                              .currency(
                                                                  symbol:
                                                                      "Rp. ",
                                                                  decimalDigits:
                                                                      0)
                                                          .format(controller
                                                                      .transactions[i]
                                                                  [
                                                                  "store_transactions"][j]
                                                              [
                                                              "items"][k]["price"]),
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: darkColor,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${controller.transactions[i]["store_transactions"][j]["items"][k]["quantity"]} pcs",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: darkColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                  ],
                ),
                controller.transactions[i]["payment_status"] ==
                        "menunggu_pembayaran"
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.4,
                              child: MyButton().btn(
                                "Bayar",
                                func: () {
                                  Get.to(
                                    () => const SnapView(),
                                    arguments: controller.transactions[i]
                                        ["snap_token"],
                                  )!
                                      .then((_) {
                                    controller.transactions.clear();
                                    controller.transactions.refresh();
                                    controller.loadingData.value = true;
                                    controller.loadingData.refresh();
                                    controller.page.value = 1;
                                    controller.page.refresh();
                                    controller.fetchTransactionIndex();
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Total",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: darkColor,
                                    ),
                                  ),
                                  Text(
                                    intl.NumberFormat.currency(
                                            symbol: "Rp. ", decimalDigits: 0)
                                        .format(int.tryParse(controller
                                            .transactions[i]["grand_total"])),
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: darkColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 9,
                  height: 9,
                  color: lightgreyColor,
                )
              ],
            ),
          controller.addingData.value == true
              ? Column(
                  children: const [
                    SizedBox(
                      height: 14,
                    ),
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 14,
                    ),
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }

  Widget _statusWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < controller.status.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.transactions.clear();
                      controller.transactions.refresh();
                      controller.loadingData.value = true;
                      controller.loadingData.refresh();
                      controller.page.value = 1;
                      controller.page.refresh();
                      controller.selectedStatus.value = controller.status[i];
                      controller.selectedStatus.refresh();
                      controller.selectedStatusParam.value =
                          controller.statusParam[i];
                      controller.selectedStatusParam.refresh();
                      controller.fetchTransactionIndex();
                    },
                    child: Text(
                      controller.status[i],
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: controller.selectedStatus.value ==
                                controller.status[i]
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: controller.selectedStatus.value ==
                                controller.status[i]
                            ? orangeColor
                            : darkColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  controller.selectedStatus.value == controller.status[i]
                      ? Container(
                          height: 5,
                          width: 15,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(3),
                              topRight: Radius.circular(3),
                            ),
                            color: orangeColor,
                          ),
                        )
                      : const SizedBox(
                          height: 5,
                        ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _loading() {
    return SizedBox(
      height: Get.height,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
