//pengubahan arah tombol bayar dari ke midtrans langsung, jadi ke bottommodal untuk konfirmasi dulu ya/tidak nyas

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:locahub/core/views/address/view/address.dart';
// import 'package:locahub/core/views/checkout/checkout_2/controller/checkout_2_controller.dart';
// // ignore: depend_on_referenced_packages
// import 'package:intl/intl.dart';
// import 'package:locahub/core/views/global/my_button.dart';
// import 'package:locahub/core/views/global/theme.dart';
// import 'package:locahub/core/views/voucher/view/promo_list.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Checkout2View extends StatefulWidget {
//   const Checkout2View({super.key});

//   @override
//   State<Checkout2View> createState() => _Checkout2ViewState();
// }

// class _Checkout2ViewState extends State<Checkout2View> {
//   String? address;

//   int? index;

//   String? label;

//   String? name;

//   String? phone;

//   String? district;

//   String? postcode;

//   @override
//   void initState() {
//     super.initState();
//     getAddressData();
//   }

//   void _handleReturnedValue(value) {
//     if (value == 'refresh') {
//       // Trigger a refresh here
//       getAddressData();
//     }
//   }

//   Future<void> getAddressData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? jsonString = prefs.getString('addressData');
//     if (jsonString != null) {
//       var data = json.decode(jsonString);
//       setState(() {
//         address = data['address'];
//         index = data['index'];
//         label = data['label'];
//         name = data['name'];
//         phone = data['phone'];
//         district = data['district'];
//         postcode = data['postcode'];
//       });
//       print(address);
//     }
//   }

//   final controller = Get.put(Checkout2Controller());

//   @override
//   Widget build(BuildContext context) {
//     Get.lazyPut(
//       () => Checkout2Controller(),
//     );
//     controller.onInit;
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Cart Page',
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         body: Stack(
//           children: [
//             SizedBox(
//               height: Get.height,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.of(context).padding.top,
//                   ),
//                   Stack(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(vertical: 21),
//                             decoration: BoxDecoration(
//                               color: whiteColor,
//                             ),
//                             child: Text(
//                               "Atur Barang Belanjaan",
//                               style: GoogleFonts.poppins(
//                                 fontSize: 18,
//                                 color: darkColor,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Positioned(
//                         left: 27.95,
//                         top: 24,
//                         child: InkWell(
//                           onTap: () {
//                             Get.back();
//                           },
//                           child: SizedBox(
//                             height: 18,
//                             width: 18,
//                             child: Icon(
//                               FontAwesomeIcons.chevronLeft,
//                               size: 13.33,
//                               color: textmutedColor,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Expanded(
//                     child: Obx(() {
//                       return controller.isLoading.value != true
//                           ? _content()
//                           : _loading();
//                     }),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Positioned checkoutResumeWidget() {
//     return Positioned(
//       bottom: 0,
//       child: paymentResumeWidget(),
//     );
//   }

//   Widget paymentResumeWidget() {
//     return Container(
//       width: Get.width,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 24,
//             color: Colors.black26,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 18,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Text(
//               "Total Pembayaran",
//               style: GoogleFonts.poppins(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Total Belanja",
//                   style: GoogleFonts.poppins(
//                     fontSize: 14,
//                   ),
//                 ),
//                 Text(
//                   NumberFormat.currency(symbol: "Rp. ", decimalDigits: 0)
//                       .format(
//                     controller.totalPriceItem.value,
//                   ),
//                   style: GoogleFonts.poppins(
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Ongkos Kirim",
//                   style: GoogleFonts.poppins(
//                     fontSize: 14,
//                   ),
//                 ),
//                 Text(
//                   NumberFormat.currency(symbol: "Rp. ", decimalDigits: 0)
//                       .format(
//                     controller.countTotalShipmentPrice(),
//                   ),
//                   style: GoogleFonts.poppins(
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Total",
//                   style: GoogleFonts.poppins(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   NumberFormat.currency(symbol: "Rp. ", decimalDigits: 0)
//                       .format(
//                     controller.countTotal(),
//                   ),
//                   style: GoogleFonts.poppins(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 18,
//           ),
//           Divider(
//             thickness: 9,
//             color: lightgreyColor,
//           ),
//           const SizedBox(
//             height: 18,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Total Pembayaran",
//                       style: GoogleFonts.poppins(
//                         fontSize: 12,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       NumberFormat.currency(symbol: "Rp. ", decimalDigits: 0)
//                           .format(
//                         controller.countTotal(),
//                       ),
//                       style: GoogleFonts.poppins(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: orangeColor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Obx(() {
//                   return controller.checkCourier() == true
//                       ? MyButton().btn("Bayar", func: () {
//                           controller.pay();
//                         })
//                       : MyButton().mtBtn("Bayar", func: () {
//                           // controller.pay();
//                         });
//                 }),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 18,
//           ),
//         ],
//       ),
//     );
//   }

//   _content() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Divider(
//             thickness: 9,
//             color: lightgreyColor,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 24,
//               vertical: 12,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   label ?? "Belum ada alamat dipilih",
//                   style: GoogleFonts.poppins(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Address(
//                           onReturnedValue: _handleReturnedValue,
//                         ),
//                       ),
//                     ).then((value) {
//                       // Assign a value here
//                     });
//                   },
//                   child: Text(
//                     "Ubah",
//                     style: GoogleFonts.poppins(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                       color: orangeColor,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24),
//             child: Divider(),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 24,
//             ),
//             child: Text.rich(
//               TextSpan(
//                 text: name,
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                 ),
//                 children: [
//                   const TextSpan(
//                     text: " | ",
//                   ),
//                   TextSpan(
//                     text: phone,
//                   ),
//                   const TextSpan(
//                     text: " ",
//                   ),
//                   TextSpan(
//                     text: address,
//                   ),
//                   const TextSpan(
//                     text: ", ",
//                   ),
//                   TextSpan(
//                     text: district,
//                   ),
//                   const TextSpan(
//                     text: ", ",
//                   ),
//                   TextSpan(
//                     text: postcode,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           Divider(
//             thickness: 9,
//             color: lightgreyColor,
//           ),
//           itemsWidget(),
//           promotionVoucher(),
//           Divider(
//             thickness: 9,
//             color: lightgreyColor,
//           ),
//           paymentResumeWidget(),
//         ],
//       ),
//     );
//   }

//   Widget shipmentWidget(int k) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 24,
//         vertical: 12,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Pengiriman",
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           controller.selectedProducts[k]["selected_courier"] != ""
//               ? controller.selectedProducts[k]["selected_courier_service"]
//                           ["service"] !=
//                       null
//                   ? selectedCourierService(
//                       controller.selectedProducts[k]
//                           ["selected_courier_service"],
//                       k)
//                   : Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         for (int i = 0;
//                             i <
//                                 controller
//                                     .selectedProducts[k]["courier_services"]
//                                     .length;
//                             i++)
//                           GestureDetector(
//                             onTap: () {
//                               controller.selectedProducts[k]
//                                       ["selected_courier_service"] =
//                                   controller.selectedProducts[k]
//                                       ["courier_services"][i];
//                               controller.selectedProducts.refresh();
//                             },
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "${controller.selectedProducts[k]["courier_services"][i]["service"]}",
//                                 ),
//                                 Text(
//                                   NumberFormat.currency(
//                                           symbol: "Rp. ", decimalDigits: 0)
//                                       .format(
//                                     controller.selectedProducts[k]
//                                             ["courier_services"][i]["cost"][0]
//                                         ["value"],
//                                   ),
//                                 ),
//                                 Text(
//                                   "Estimasi pengiriman ${controller.selectedProducts[k]["courier_services"][i]["cost"][0]["etd"]} hari",
//                                 ),
//                                 const SizedBox(
//                                   height: 8,
//                                 ),
//                               ],
//                             ),
//                           ),
//                       ],
//                     )
//               : InkWell(
//                   onTap: () {
//                     controller.cd2(k);
//                   },
//                   child: const Text("Pilih Kurir"),
//                 ),
//         ],
//       ),
//     );
//   }

//   Widget selectedCourierService(selectedCourierService, int k) {
//     return GestureDetector(
//       onTap: () {
//         controller.selectedProducts[k]["selected_courier"] = "";
//         controller.selectedProducts.refresh();
//         controller.selectedProducts[k]["selected_courier_service"]["service"] =
//             null;
//         controller.selectedProducts.refresh();
//         controller.cd2(k);
//       },
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text.rich(
//                 TextSpan(
//                   text: "${selectedCourierService["service"]} ",
//                   style: GoogleFonts.poppins(
//                     fontSize: 14,
//                   ),
//                   children: [
//                     TextSpan(
//                       text: NumberFormat.currency(
//                               name: "IDR", symbol: "Rp. ", decimalDigits: 0)
//                           .format(controller.selectedProducts[k]
//                               ["selected_courier_service"]["cost"][0]["value"]),
//                       style: GoogleFonts.poppins(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Text(
//                 "Estimasi pengiriman ${controller.selectedProducts[k]["selected_courier_service"]["cost"][0]["etd"]} hari",
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                 ),
//               ),
//             ],
//           ),
//           Icon(
//             FontAwesomeIcons.chevronRight,
//             color: textmutedColor,
//             size: 13,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget itemsWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         for (int i = 0; i < controller.selectedProducts.length; i++)
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 12,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: Text(
//                   controller.selectedProducts[i]["store_name"],
//                   style: GoogleFonts.poppins(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24),
//                 child: Divider(),
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: Column(
//                   children: [
//                     for (int j = 0;
//                         j < controller.selectedProducts[i]["items"].length;
//                         j++)
//                       Column(
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 height: 76,
//                                 width: 76,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(8),
//                                   color: orangeColor,
//                                 ),
//                                 child: controller.selectedProducts[i]["items"]
//                                             [j]["img_url"] !=
//                                         null
//                                     ? ClipRRect(
//                                         borderRadius: BorderRadius.circular(8),
//                                         child: Image.network(
//                                           controller.selectedProducts[i]
//                                               ["items"][j]["img_url"],
//                                           errorBuilder:
//                                               (context, error, stackTrace) {
//                                             return const Center(
//                                               child: Text("Gambar tidak ada"),
//                                             );
//                                           },
//                                         ),
//                                       )
//                                     : const Center(
//                                         child: Text("Tidak ada gambar"),
//                                       ),
//                               ),
//                               const SizedBox(
//                                 width: 12,
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       controller.selectedProducts[i]["items"][j]
//                                           ["product_name"],
//                                       style: GoogleFonts.poppins(
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                     controller.selectedProducts[i]["items"][j]
//                                                 ["variation_name"] !=
//                                             null
//                                         ? Column(
//                                             children: [
//                                               const SizedBox(
//                                                 height: 5,
//                                               ),
//                                               Text(
//                                                 "Variasi: ${controller.selectedProducts[i]["items"][j]["variation_name"]}",
//                                                 style: GoogleFonts.poppins(
//                                                   fontSize: 12,
//                                                   color: textmutedColor,
//                                                 ),
//                                               ),
//                                             ],
//                                           )
//                                         : const SizedBox(),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           NumberFormat.currency(
//                                             locale: "id_ID",
//                                             name: "IDR",
//                                             symbol: "Rp. ",
//                                             decimalDigits: 0,
//                                           ).format(
//                                             int.tryParse(controller
//                                                         .selectedProducts[i]
//                                                     ["items"][j]["price"]) ??
//                                                 0,
//                                           ),
//                                           style: GoogleFonts.poppins(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         Text(
//                                           "${controller.selectedProducts[i]["items"][j]["qty"]} pcs",
//                                           style: GoogleFonts.poppins(
//                                             fontSize: 12,
//                                             color: textmutedColor,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 21,
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//               Divider(
//                 thickness: 9,
//                 color: lightgreyColor,
//               ),
//               shipmentWidget(i),
//               Divider(
//                 thickness: 9,
//                 color: lightgreyColor,
//               ),
//             ],
//           ),
//       ],
//     );
//   }

//   _loading() {
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }

//   Widget promotionVoucher() {
//     return Container(
//         margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Image.asset('assets/icon/percentage.png'),
//             const SizedBox(width: 18),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Gunakan Promo',
//                     style: darkTextStyle.copyWith(
//                         fontSize: 14, fontWeight: FontWeight.w400),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     'HARBOLNAS2121',
//                     style: mutedTextStyle.copyWith(
//                         fontSize: 12, fontWeight: FontWeight.w400),
//                   ),
//                 ],
//               ),
//             ),
//             const Spacer(),
//             InkWell(
//               onTap: () {
//                 Get.to(
//                   () => const PromoList(),
//                 );
//               },
//               child: Icon(
//                 Icons.arrow_forward_ios,
//                 color: darkgreyColor,
//                 size: 14,
//               ),
//             ),
//           ],
//         ));
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locahub/core/views/address/view/address.dart';
import 'package:locahub/core/views/checkout/checkout_2/controller/checkout_2_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:locahub/core/views/global/my_button.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/voucher/view/promo_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Checkout2View extends StatefulWidget {
  const Checkout2View({super.key});

  @override
  State<Checkout2View> createState() => _Checkout2ViewState();
}

class _Checkout2ViewState extends State<Checkout2View> {
  String? address;

  int? index;

  String? label;

  String? name;

  String? phone;

  String? district;

  String? postcode;

  @override
  void initState() {
    super.initState();
    getAddressData();
  }

  void _handleReturnedValue(value) {
    if (value == 'refresh') {
      // Trigger a refresh here
      getAddressData();
    }
  }

  Future<void> getAddressData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('addressData');
    if (jsonString != null) {
      var data = json.decode(jsonString);
      setState(() {
        address = data['address'];
        index = data['index'];
        label = data['label'];
        name = data['name'];
        phone = data['phone'];
        district = data['district'];
        postcode = data['postcode'];
      });
      print(address);
    }
  }

  final controller = Get.put(Checkout2Controller());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => Checkout2Controller(),
    );
    controller.onInit;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cart Page',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SizedBox(
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
                              "Atur Barang Belanjaan",
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
                  Expanded(
                    child: Obx(() {
                      return controller.isLoading.value != true
                          ? _content()
                          : _loading();
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned checkoutResumeWidget() {
    return Positioned(
      bottom: 0,
      child: paymentResumeWidget(),
    );
  }

  Widget paymentResumeWidget() {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 24,
            color: Colors.black26,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Total Pembayaran",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Belanja",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
                Text(
                  NumberFormat.currency(symbol: "Rp. ", decimalDigits: 0)
                      .format(
                    controller.totalPriceItem.value,
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ongkos Kirim",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
                Text(
                  NumberFormat.currency(symbol: "Rp. ", decimalDigits: 0)
                      .format(
                    controller.countTotalShipmentPrice(),
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  NumberFormat.currency(symbol: "Rp. ", decimalDigits: 0)
                      .format(
                    controller.countTotal(),
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Divider(
            thickness: 9,
            color: lightgreyColor,
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Pembayaran",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      NumberFormat.currency(symbol: "Rp. ", decimalDigits: 0)
                          .format(
                        controller.countTotal(),
                      ),
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: orangeColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  //width: double.infinity,
                  height: 43,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: orangeColor),
                      child: Text(
                        'Bayar',
                        style: whiteTextStyle.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      onPressed: () {
                        bottomModal();
                      }),
                ),
                // Obx(() {
                //   return MyButton().btn("Bayar", func: () {
                //     bottomModal();
                //   });
                //   // return controller.checkCourier() == true
                //   //     ? MyButton().btn("Bayar", func: () {
                //   //         controller.pay();
                //   //       })
                //   //     : MyButton().mtBtn("Bayar", func: () {
                //   //         // controller.pay();
                //   //       });
                // }),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }

  _content() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            thickness: 9,
            color: lightgreyColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label ?? "Belum ada alamat dipilih",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Address(
                          onReturnedValue: _handleReturnedValue,
                        ),
                      ),
                    ).then((value) {
                      // Assign a value here
                    });
                  },
                  child: Text(
                    "Ubah",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: orangeColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Text.rich(
              TextSpan(
                text: name,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
                children: [
                  const TextSpan(
                    text: " | ",
                  ),
                  TextSpan(
                    text: phone,
                  ),
                  const TextSpan(
                    text: " ",
                  ),
                  TextSpan(
                    text: address,
                  ),
                  const TextSpan(
                    text: ", ",
                  ),
                  TextSpan(
                    text: district,
                  ),
                  const TextSpan(
                    text: ", ",
                  ),
                  TextSpan(
                    text: postcode,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Divider(
            thickness: 9,
            color: lightgreyColor,
          ),
          itemsWidget(),
          //promotionVoucher(),
          // Divider(
          //   thickness: 9,
          //   color: lightgreyColor,
          // ),
          paymentResumeWidget(),
        ],
      ),
    );
  }

  Widget shipmentWidget(int k) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pengiriman",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          controller.selectedProducts[k]["selected_courier"] != ""
              ? controller.selectedProducts[k]["selected_courier_service"]
                          ["service"] !=
                      null
                  ? selectedCourierService(
                      controller.selectedProducts[k]
                          ["selected_courier_service"],
                      k)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0;
                            i <
                                controller
                                    .selectedProducts[k]["courier_services"]
                                    .length;
                            i++)
                          GestureDetector(
                            onTap: () {
                              controller.selectedProducts[k]
                                      ["selected_courier_service"] =
                                  controller.selectedProducts[k]
                                      ["courier_services"][i];
                              controller.selectedProducts.refresh();
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.selectedProducts[k]["courier_services"][i]["service"]}",
                                ),
                                Text(
                                  NumberFormat.currency(
                                          symbol: "Rp. ", decimalDigits: 0)
                                      .format(
                                    controller.selectedProducts[k]
                                            ["courier_services"][i]["cost"][0]
                                        ["value"],
                                  ),
                                ),
                                Text(
                                  "Estimasi pengiriman ${controller.selectedProducts[k]["courier_services"][i]["cost"][0]["etd"]} hari",
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                      ],
                    )
              : InkWell(
                  onTap: () {
                    controller.cd2(k);
                  },
                  child: const Text("Pilih Kurir"),
                ),
        ],
      ),
    );
  }

  Widget selectedCourierService(selectedCourierService, int k) {
    return GestureDetector(
      onTap: () {
        controller.selectedProducts[k]["selected_courier"] = "";
        controller.selectedProducts.refresh();
        controller.selectedProducts[k]["selected_courier_service"]["service"] =
            null;
        controller.selectedProducts.refresh();
        controller.cd2(k);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: "${selectedCourierService["service"]} ",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: NumberFormat.currency(
                              name: "IDR", symbol: "Rp. ", decimalDigits: 0)
                          .format(controller.selectedProducts[k]
                              ["selected_courier_service"]["cost"][0]["value"]),
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Estimasi pengiriman ${controller.selectedProducts[k]["selected_courier_service"]["cost"][0]["etd"]} hari",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Icon(
            FontAwesomeIcons.chevronRight,
            color: textmutedColor,
            size: 13,
          ),
        ],
      ),
    );
  }

  Widget itemsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < controller.selectedProducts.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  controller.selectedProducts[i]["store_name"],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Divider(),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    for (int j = 0;
                        j < controller.selectedProducts[i]["items"].length;
                        j++)
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 76,
                                width: 76,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: orangeColor,
                                ),
                                child: controller.selectedProducts[i]["items"]
                                            [j]["img_url"] !=
                                        null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          controller.selectedProducts[i]
                                              ["items"][j]["img_url"],
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Center(
                                              child: Text("Gambar tidak ada"),
                                            );
                                          },
                                        ),
                                      )
                                    : const Center(
                                        child: Text("Tidak ada gambar"),
                                      ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.selectedProducts[i]["items"][j]
                                          ["product_name"],
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                      ),
                                    ),
                                    controller.selectedProducts[i]["items"][j]
                                                ["variation_name"] !=
                                            null
                                        ? Column(
                                            children: [
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Variasi: ${controller.selectedProducts[i]["items"][j]["variation_name"]}",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color: textmutedColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox(),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          NumberFormat.currency(
                                            locale: "id_ID",
                                            name: "IDR",
                                            symbol: "Rp. ",
                                            decimalDigits: 0,
                                          ).format(
                                            int.tryParse(controller
                                                        .selectedProducts[i]
                                                    ["items"][j]["price"]) ??
                                                0,
                                          ),
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${controller.selectedProducts[i]["items"][j]["qty"]} pcs",
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: textmutedColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Divider(
                thickness: 9,
                color: lightgreyColor,
              ),
              shipmentWidget(i),
              Divider(
                thickness: 9,
                color: lightgreyColor,
              ),
            ],
          ),
      ],
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget promotionVoucher() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/icon/percentage.png'),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gunakan Promo',
                    style: darkTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'HARBOLNAS2121',
                    style: mutedTextStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Get.to(
                  () => const PromoList(),
                );
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: darkgreyColor,
                size: 14,
              ),
            ),
          ],
        ));
  }

  Future bottomModal() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      backgroundColor: whiteColor,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          height: 250,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Konfirmasi Pesanan',
                  style: darkTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Apakah anda yakin untuk melanjutkan ke tahap pembayaran?',
                      style: darkTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        //width: double.infinity,
                        height: 43,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: greyColor),
                          child: Text(
                            'Tidak',
                            style: darkTextStyle.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Obx(() {
                        return controller.checkCourier() == true
                            ? MyButton().btn("Ya", func: () {
                                controller.pay();
                              })
                            : MyButton().mtBtn("Ya", func: () {
                                // controller.pay();
                              });
                      }),

                      // child: controller.checkCourier() == true
                      //     ? SizedBox(
                      //         //width: double.infinity,
                      //         height: 43,
                      //         child: ElevatedButton(
                      //           style: ElevatedButton.styleFrom(
                      //               shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(10),
                      //               ),
                      //               backgroundColor: orangeColor),
                      //           child: Text(
                      //             'Ya',
                      //             style: whiteTextStyle.copyWith(
                      //                 fontWeight: FontWeight.w700,
                      //                 fontSize: 14),
                      //           ),
                      //           onPressed: () {
                      //             Obx(() {
                      //               return controller.pay();
                      //             });
                      //           },
                      //         ),
                      //       )
                      //     : SizedBox(
                      //         //width: double.infinity,
                      //         height: 43,
                      //         child: ElevatedButton(
                      //           style: ElevatedButton.styleFrom(
                      //               shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(10),
                      //               ),
                      //               backgroundColor: orangeColor),
                      //           child: Text(
                      //             'Ya',
                      //             style: whiteTextStyle.copyWith(
                      //                 fontWeight: FontWeight.w700,
                      //                 fontSize: 14),
                      //           ),
                      //           onPressed: () {},
                      //         ),
                      //       ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
