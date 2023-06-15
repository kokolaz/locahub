// import 'package:clipboard/clipboard.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:locahub/core/views/order/view/invoice.dart';
// import 'package:locahub/core/views/order/view/submit_review.dart';
// import 'package:locahub/core/views/order/view/tracking_order.dart';
// import 'package:locahub/core/views/global/theme.dart';
// import 'package:intl/intl.dart';

// class OrderCompleted extends StatefulWidget {
//   const OrderCompleted({super.key});

//   @override
//   State<OrderCompleted> createState() => _OrderCompletedState();
// }

// class _OrderCompletedState extends State<OrderCompleted> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: whiteColor,
//         appBar: AppBar(
//           //normalnya 56
//           toolbarHeight: 80,
//           backgroundColor: Colors.transparent,
//           bottomOpacity: 0.0,
//           elevation: 0.0,
//           centerTitle: true,
//           title: Text(
//             "Rincian Pesanan",
//             style: darkTextStyle.copyWith(
//                 fontSize: 16, fontWeight: FontWeight.w400),
//           ),
//           leading: IconButton(
//             //harusnya gapake padding
//             padding: const EdgeInsets.only(left: 12),
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: darkgreyColor,
//               size: 14,
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ),
//         body: ListView(
//           children: [
//             greyContainer(),
//             content(),
//             greyContainer(),
//             orderInformation(),
//             greyContainer(),
//             shippingInformation(),
//             greyContainer(),
//             shippingAddress(),
//             greyContainer(),
//             product(),
//             greyContainer(),
//             customerNote(),
//             greyContainer(),
//             totalPayment(),
//             greyContainer(),
//             buttons(),
//           ],
//         ));
//   }

//   Widget greyContainer() {
//     return Container(
//       height: 9,
//       color: lightgreyColor,
//     );
//   }

//   Widget content() {
//     return Container(
//       padding: const EdgeInsets.only(left: 24, right: 24, top: 23, bottom: 26),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 'Pesanan Selesai',
//                 style: orangeTextStyle.copyWith(
//                     fontSize: 14, fontWeight: FontWeight.w700),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 'Terima kasih telah belanja di Locahubie.',
//                 style: mutedTextStyle.copyWith(
//                     fontSize: 12, fontWeight: FontWeight.w400),
//               ),
//             ],
//           ),
//           Image.asset('assets/icon/orderarrived.png')
//         ],
//       ),
//     );
//   }

//   Widget orderInformation() {
//     return Container(
//       padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Informasi Pesanan',
//                 style: darkTextStyle.copyWith(
//                     fontSize: 14, fontWeight: FontWeight.w700),
//               ),
//               Row(
//                 children: [
//                   Image.asset('assets/icon/see_invoice.png'),
//                   const SizedBox(width: 8),
//                   GestureDetector(
//                     onTap: () {
//                       Get.to(() {
//                         return const Invoice();
//                       });
//                     },
//                     child: Text(
//                       'Lihat Invoice',
//                       style: orangeTextStyle.copyWith(
//                           fontSize: 12, fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 13),
//           Divider(color: greyColor, height: 1, thickness: 1),
//           const SizedBox(height: 19),
//           Text(
//             'Invoice',
//             style: darkTextStyle.copyWith(
//                 fontSize: 14, fontWeight: FontWeight.w700),
//           ),
//           const SizedBox(height: 5),
//           Row(
//             children: [
//               Text(
//                 'INV20210827113500010',
//                 style: darkTextStyle.copyWith(
//                     fontSize: 14, fontWeight: FontWeight.w400),
//               ),
//               const SizedBox(width: 7),
//               GestureDetector(
//                   onTap: () {
//                     FlutterClipboard.copy('INV20210827113500010')
//                         .then((value) => print('copied'));
//                   },
//                   child: Row(
//                     children: [
//                       Image.asset('assets/icon/copy.png'),
//                       const SizedBox(width: 7),
//                       Text(
//                         'Salin',
//                         style: orangeTextStyle.copyWith(
//                             fontSize: 12, fontWeight: FontWeight.w700),
//                       ),
//                     ],
//                   )),
//             ],
//           ),
//           const SizedBox(height: 14),
//           Text(
//             'Waktu Pembelian',
//             style: darkTextStyle.copyWith(
//                 fontSize: 14, fontWeight: FontWeight.w700),
//           ),
//           const SizedBox(height: 5),
//           Row(
//             children: [
//               Text(
//                 '22 Agustus 2021 10:00',
//                 style: darkTextStyle.copyWith(
//                     fontSize: 14, fontWeight: FontWeight.w400),
//               ),
//               const SizedBox(width: 5),
//               GestureDetector(
//                 onTap: () {
//                   bottomModal();
//                 },
//                 child: Text(
//                   'Lihat Rincian Waktu',
//                   style: orangeTextStyle.copyWith(
//                       fontSize: 12, fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 14),
//           Text(
//             'Toko',
//             style: darkTextStyle.copyWith(
//                 fontSize: 14, fontWeight: FontWeight.w700),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             'Kios Kopi Floratama',
//             style: darkTextStyle.copyWith(
//                 fontSize: 14, fontWeight: FontWeight.w400),
//           ),
//           const SizedBox(height: 14),
//           Text(
//             'Metode Pembayaran',
//             style: darkTextStyle.copyWith(
//                 fontSize: 14, fontWeight: FontWeight.w700),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             'Midtrans',
//             style: darkTextStyle.copyWith(
//                 fontSize: 14, fontWeight: FontWeight.w400),
//           ),
//           const SizedBox(height: 17),
//         ],
//       ),
//     );
//   }

//   Widget shippingInformation() {
//     return Container(
//       padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Informasi Pengiriman',
//                 style: darkTextStyle.copyWith(
//                     fontSize: 14, fontWeight: FontWeight.w700),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Get.to(() {
//                     return const TrackingOrder();
//                   });
//                 },
//                 child: Text(
//                   'Selengkapnya >>',
//                   style: orangeTextStyle.copyWith(
//                       fontSize: 12, fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 13),
//           Divider(color: greyColor, height: 1, thickness: 1),
//           const SizedBox(height: 19),
//           Text(
//             'Reguler',
//             style: darkTextStyle.copyWith(
//                 fontSize: 14, fontWeight: FontWeight.w400),
//           ),
//           Row(
//             children: [
//               Text(
//                 'J&T Express - JP6324376298',
//                 style: darkTextStyle.copyWith(
//                     fontSize: 14, fontWeight: FontWeight.w400),
//               ),
//               const SizedBox(width: 7),
//               GestureDetector(
//                 onTap: () {
//                   FlutterClipboard.copy('JP6324376298')
//                       .then((value) => print('copied'));
//                 },
//                 child: Row(
//                   children: [
//                     Image.asset('assets/icon/copy.png'),
//                     const SizedBox(width: 7),
//                     Text(
//                       'Salin',
//                       style: orangeTextStyle.copyWith(
//                           fontSize: 12, fontWeight: FontWeight.w700),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Row(
//             children: [
//               Image.asset('assets/icon/orderstatus.png'),
//               const SizedBox(width: 8),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Paket telah diterima',
//                     style: orangeTextStyle.copyWith(
//                         fontSize: 12, fontWeight: FontWeight.w700),
//                   ),
//                   Text(
//                     '25 Agustus 2021 13:15',
//                     style: mutedTextStyle.copyWith(
//                         fontSize: 12, fontWeight: FontWeight.w400),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 17),
//         ],
//       ),
//     );
//   }

//   Widget shippingAddress() {
//     return Container(
//       padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Alamat Pengiriman',
//                 style: darkTextStyle.copyWith(
//                     fontSize: 14, fontWeight: FontWeight.w700),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   FlutterClipboard.copy(
//                           'Jl. Trunojoyo No. 89, Lombok Kulon, Wonosari, Kabupaten Bondowoso, Jawa Timur. 68282.')
//                       .then((value) => print('copied'));
//                 },
//                 child: Row(
//                   children: [
//                     Image.asset('assets/icon/copy.png'),
//                     const SizedBox(width: 7),
//                     Text(
//                       'Salin',
//                       style: orangeTextStyle.copyWith(
//                           fontSize: 12, fontWeight: FontWeight.w700),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 13),
//           Divider(color: greyColor, height: 1, thickness: 1),
//           const SizedBox(height: 19),
//           Text(
//             'Alamat Rumah',
//             style: darkTextStyle.copyWith(
//                 fontSize: 14, fontWeight: FontWeight.w700),
//           ),
//           const SizedBox(height: 5),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Eris Dwi Septiawan Rizal',
//                 style: darkTextStyle.copyWith(
//                     fontSize: 14, fontWeight: FontWeight.w400),
//               ),
//               Text(
//                 '   |   ',
//                 style: mutedTextStyle.copyWith(
//                     fontSize: 14, fontWeight: FontWeight.w400),
//               ),
//               Expanded(
//                 child: Text(
//                   '+62 857 5505 5835',
//                   style: darkTextStyle.copyWith(
//                       fontSize: 14, fontWeight: FontWeight.w400),
//                 ),
//               ),
//             ],
//           ),
//           Text(
//             'Jl. Trunojoyo No. 89, Lombok Kulon, Wonosari, Kabupaten Bondowoso, Jawa Timur. 68282.',
//             style: darkTextStyle.copyWith(
//                 fontSize: 14, fontWeight: FontWeight.w400),
//           ),
//           const SizedBox(height: 17),
//         ],
//       ),
//     );
//   }

//   Widget product() {
//     return Container(
//       padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             'Produk',
//             style: darkTextStyle.copyWith(
//                 fontSize: 14, fontWeight: FontWeight.w700),
//           ),
//           const SizedBox(height: 13),
//           Divider(color: greyColor, height: 1, thickness: 1),
//           const SizedBox(height: 19),
//           Row(
//             children: [
//               Container(
//                 width: 65,
//                 height: 65,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   image: const DecorationImage(
//                       image: AssetImage(
//                           'assets/images/product/default_product.png'),
//                       fit: BoxFit.cover),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               Flexible(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Otten Coffee - Flores Manggarai Kopi Arabica',
//                       overflow: TextOverflow.ellipsis,
//                       style: darkTextStyle.copyWith(
//                           fontSize: 14, fontWeight: FontWeight.w400),
//                     ),
//                     const SizedBox(height: 5),
//                     Text(
//                       'Variasi: Kemasan 500gr',
//                       style: mutedTextStyle.copyWith(
//                           fontSize: 12, fontWeight: FontWeight.w400),
//                     ),
//                     const SizedBox(height: 5),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text.rich(
//                           overflow: TextOverflow.ellipsis,
//                           TextSpan(
//                             //apply style to all
//                             children: [
//                               TextSpan(
//                                 text: NumberFormat.currency(
//                                   locale: "id_ID",
//                                   name: "IDR",
//                                   symbol: "Rp ",
//                                   decimalDigits: 0,
//                                 ).format(150000),
//                                 style: darkTextStyle.copyWith(
//                                     fontWeight: FontWeight.w700, fontSize: 14),
//                               ),
//                               const TextSpan(text: '  '),
//                               TextSpan(
//                                 text: NumberFormat.currency(
//                                   locale: "id_ID",
//                                   name: "IDR",
//                                   symbol: "Rp ",
//                                   decimalDigits: 0,
//                                 ).format(160000),
//                                 style: mutedTextStyle.copyWith(
//                                     fontWeight: FontWeight.w700,
//                                     decoration: TextDecoration.lineThrough,
//                                     fontSize: 10),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Text(
//                           '1 pcs',
//                           style: darkTextStyle.copyWith(
//                               fontSize: 14, fontWeight: FontWeight.w400),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 18),
//           Row(
//             children: [
//               Container(
//                 width: 65,
//                 height: 65,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   image: const DecorationImage(
//                       image: AssetImage(
//                           'assets/images/product/default_product.png'),
//                       fit: BoxFit.cover),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               Flexible(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Otten Coffee - Flores Manggarai Robusta',
//                       overflow: TextOverflow.ellipsis,
//                       style: darkTextStyle.copyWith(
//                           fontSize: 14, fontWeight: FontWeight.w400),
//                     ),
//                     const SizedBox(height: 5),
//                     Text(
//                       'Variasi: Kemasan 500gr',
//                       style: mutedTextStyle.copyWith(
//                           fontSize: 12, fontWeight: FontWeight.w400),
//                     ),
//                     const SizedBox(height: 5),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text.rich(
//                           overflow: TextOverflow.ellipsis,
//                           TextSpan(
//                             //apply style to all
//                             children: [
//                               TextSpan(
//                                 text: NumberFormat.currency(
//                                   locale: "id_ID",
//                                   name: "IDR",
//                                   symbol: "Rp ",
//                                   decimalDigits: 0,
//                                 ).format(120000),
//                                 style: darkTextStyle.copyWith(
//                                     fontWeight: FontWeight.w700, fontSize: 14),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Text(
//                           '1 pcs',
//                           style: darkTextStyle.copyWith(
//                               fontSize: 14, fontWeight: FontWeight.w400),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Divider(color: greyColor, height: 1, thickness: 1),
//           const SizedBox(height: 14),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Total Belanja',
//                   style: darkTextStyle.copyWith(
//                       fontWeight: FontWeight.w700, fontSize: 14)),
//               Text(
//                   NumberFormat.currency(
//                     locale: "id_ID",
//                     name: "IDR",
//                     symbol: "Rp ",
//                     decimalDigits: 0,
//                   ).format(270000),
//                   style: darkTextStyle.copyWith(
//                       fontWeight: FontWeight.w700, fontSize: 14)),
//             ],
//           ),
//           const SizedBox(height: 17),
//         ],
//       ),
//     );
//   }

//   Widget customerNote() {
//     return Container(
//       padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             'Catatan Pembeli',
//             style: darkTextStyle.copyWith(
//                 fontSize: 14, fontWeight: FontWeight.w700),
//           ),
//           const SizedBox(height: 13),
//           Divider(color: greyColor, height: 1, thickness: 1),
//           const SizedBox(height: 19),
//           Text(
//             'Usahakan cepat dikirim, karena 6 hari lagi saya harus keluar kota. Thanks :)',
//             style: darkTextStyle.copyWith(
//                 fontSize: 14, fontWeight: FontWeight.w400),
//           ),
//           const SizedBox(height: 17),
//         ],
//       ),
//     );
//   }

//   Widget totalPayment() {
//     return Container(
//       padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             'Total Pembayaran',
//             style: darkTextStyle.copyWith(
//                 fontSize: 14, fontWeight: FontWeight.w700),
//           ),
//           const SizedBox(height: 13),
//           Divider(color: greyColor, height: 1, thickness: 1),
//           const SizedBox(height: 19),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Total Belanja',
//                       style: darkTextStyle.copyWith(
//                           fontWeight: FontWeight.w400, fontSize: 14)),
//                   Text('Diskon Belanja',
//                       style: darkTextStyle.copyWith(
//                           fontWeight: FontWeight.w400, fontSize: 14)),
//                   Text('Ongkos Kirim',
//                       style: darkTextStyle.copyWith(
//                           fontWeight: FontWeight.w400, fontSize: 14)),
//                   Text('Diskon Ongkos Kirim',
//                       style: darkTextStyle.copyWith(
//                           fontWeight: FontWeight.w400, fontSize: 14)),
//                   Text('Total Pembayaran',
//                       style: darkTextStyle.copyWith(
//                           fontWeight: FontWeight.w700, fontSize: 14)),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     NumberFormat.currency(
//                       locale: "id_ID",
//                       name: "IDR",
//                       symbol: "Rp ",
//                       decimalDigits: 0,
//                     ).format(270000),
//                     style: darkTextStyle.copyWith(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   Text(
//                     NumberFormat.currency(
//                       locale: "id_ID",
//                       name: "IDR",
//                       symbol: "- Rp ",
//                       decimalDigits: 0,
//                     ).format(20000),
//                     style: darkTextStyle.copyWith(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   Text(
//                     NumberFormat.currency(
//                       locale: "id_ID",
//                       name: "IDR",
//                       symbol: "Rp ",
//                       decimalDigits: 0,
//                     ).format(26000),
//                     style: darkTextStyle.copyWith(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   Text(
//                     NumberFormat.currency(
//                       locale: "id_ID",
//                       name: "IDR",
//                       symbol: "Rp ",
//                       decimalDigits: 0,
//                     ).format(0),
//                     style: darkTextStyle.copyWith(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   Text(
//                     NumberFormat.currency(
//                       locale: "id_ID",
//                       name: "IDR",
//                       symbol: "Rp ",
//                       decimalDigits: 0,
//                     ).format(296000),
//                     style: darkTextStyle.copyWith(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//           const SizedBox(height: 17),
//         ],
//       ),
//     );
//   }

//   Widget buttons() {
//     return Container(
//       padding: const EdgeInsets.only(left: 24, right: 24, top: 25, bottom: 50),
//       child: Column(
//         children: [
//           SizedBox(
//             width: double.infinity,
//             height: 43,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   backgroundColor: greyColor),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset('assets/icon/message.png'),
//                   const SizedBox(width: 12),
//                   Text(
//                     'Hubungi Penjual',
//                     style: darkTextStyle.copyWith(
//                         fontSize: 14, fontWeight: FontWeight.w700),
//                   ),
//                 ],
//               ),
//               onPressed: () {
//                 //  Get.to(() {
//                 //         return const NotYetPaid();
//                 //       });
//               },
//             ),
//           ),
//           const SizedBox(height: 24),
//           Row(
//             children: [
//               Expanded(
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: 43,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         backgroundColor: greyColor),
//                     child: Text(
//                       'Beri Penilaian',
//                       style: darkTextStyle.copyWith(
//                           fontSize: 14, fontWeight: FontWeight.w700),
//                     ),
//                     onPressed: () {
//                       Get.to(() {
//                         return const SubmitReview();
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: 43,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         backgroundColor: orangeColor),
//                     child: Text(
//                       'Beli Lagi',
//                       style: whiteTextStyle.copyWith(
//                           fontSize: 14, fontWeight: FontWeight.w700),
//                     ),
//                     onPressed: () {
//                       //  Get.to(() {
//                       //         return const NotYetPaid();
//                       //       });
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Future bottomModal() {
//     return showModalBottomSheet(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(50),
//           topRight: Radius.circular(50),
//         ),
//       ),
//       backgroundColor: whiteColor,
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           //padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
//           height: 250,
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(50),
//               topRight: Radius.circular(50),
//             ),
//             color: whiteColor,
//           ),
//           child: Container(
//             padding: const EdgeInsets.only(left: 24, right: 24, top: 21),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text('Rincian Waktu',
//                     style: darkTextStyle.copyWith(
//                         fontSize: 16, fontWeight: FontWeight.w700)),
//                 const SizedBox(height: 18),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Waktu Pembelian',
//                             style: darkTextStyle.copyWith(
//                                 fontWeight: FontWeight.w400, fontSize: 14)),
//                         Text('Waktu Pembayaran',
//                             style: darkTextStyle.copyWith(
//                                 fontWeight: FontWeight.w400, fontSize: 14)),
//                         Text('Waktu Dikirim',
//                             style: darkTextStyle.copyWith(
//                                 fontWeight: FontWeight.w400, fontSize: 14)),
//                         Text('Waktu Pesanan Sampai',
//                             style: darkTextStyle.copyWith(
//                                 fontWeight: FontWeight.w400, fontSize: 14)),
//                         Text('Waktu Pesanan Diterima',
//                             style: darkTextStyle.copyWith(
//                                 fontWeight: FontWeight.w400, fontSize: 14)),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text('22 Agustus 2021 10:00',
//                             style: darkTextStyle.copyWith(
//                                 fontWeight: FontWeight.w400, fontSize: 14)),
//                         Text('22 Agustus 2021 10:00',
//                             style: darkTextStyle.copyWith(
//                                 fontWeight: FontWeight.w400, fontSize: 14)),
//                         Text('22 Agustus 2021 16:30',
//                             style: darkTextStyle.copyWith(
//                                 fontWeight: FontWeight.w400, fontSize: 14)),
//                         Text('25 Agustus 2021 09:20',
//                             style: darkTextStyle.copyWith(
//                                 fontWeight: FontWeight.w400, fontSize: 14)),
//                         Text('25 Agustus 2021 13:15',
//                             style: darkTextStyle.copyWith(
//                                 fontWeight: FontWeight.w400, fontSize: 14)),
//                       ],
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
