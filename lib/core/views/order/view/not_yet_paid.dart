import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/views/order/view/invoice.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' as intl;
import 'package:locahub/core/views/order/view/tracking_order.dart';

class NotYetPaid extends StatefulWidget {
  const NotYetPaid(
      {super.key,
      this.invoice,
      this.timeOrder,
      this.storeName,
      this.courier,
      this.price,
      this.productName,
      this.alamat,
      this.addressStore,
      this.status,
      this.quantity,
      this.costCourier,
      this.image,
      this.resi,
      this.shippingService});
  final String? invoice;
  final String? timeOrder;
  final String? storeName;
  final String? courier;
  final String? image;
  final String? addressStore;
  final String? resi;
  final String? shippingService;
  final String? status;
  final int? price;
  final String? productName;
  final String? alamat;
  final int? quantity;
  final int? costCourier;

  @override
  State<NotYetPaid> createState() => _NotYetPaidState();
}

class _NotYetPaidState extends State<NotYetPaid> {
  @override
  Widget build(BuildContext context) {
    print(widget.costCourier);
    final totalPrice =
        widget.quantity! * widget.price!; // calculate the total price
    final payTotal =
        widget.costCourier! + totalPrice; // calculate the total pay
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          //normalnya 56
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Rincian Pesanan",
            style: darkTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w400),
          ),
          leading: IconButton(
            //harusnya gapake padding
            padding: const EdgeInsets.only(left: 12),
            icon: Icon(
              Icons.arrow_back_ios,
              color: darkgreyColor,
              size: 14,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(
          children: [
            greyContainer(),
            if (widget.status == "menunggu_pembayaran") ...[
              contentNotYetPaid()
            ] else if (widget.status == "dibayar") ...[
              contentWaitConfirm()
            ] else if (widget.status == "dikirim") ...[
              contentOrderSent()
            ] else if (widget.status == "selesai") ...[
              contentOrderFinish()
            ],
            greyContainer(),
            widget.status == "menunggu_pembayaran"
                ? const SizedBox()
                : Column(
                    children: [
                      orderInformation(payTotal),
                      greyContainer(),
                    ],
                  ),
            shippingInformation(),
            greyContainer(),
            shippingAddress(),
            greyContainer(),
            product(totalPrice: totalPrice),
            greyContainer(),
            customerNote(),
            greyContainer(),
            totalPayment(totalPrice: totalPrice, payTotal: payTotal),
            greyContainer(),
            buttons(),
          ],
        ));
  }

  Widget greyContainer() {
    return Container(
      height: 9,
      color: lightgreyColor,
    );
  }

  Widget contentNotYetPaid() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 23, bottom: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Belum Bayar',
                style: orangeTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Text(
                'Selesaikan pembayaran Anda terlebih dahulu',
                style: mutedTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
              Text(
                'Lihat Panduan Pembayaran',
                style: orangeTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Image.asset('assets/icon/warning.png')
        ],
      ),
    );
  }

  Widget contentWaitConfirm() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 23, bottom: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Menunggu Konfirmasi',
                style: orangeTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 250,
                child: Text(
                  'Pesanan Anda sedang menunggu konfirmasi oleh penjual.',
                  style: mutedTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          Image.asset('assets/icon/packed.png')
        ],
      ),
    );
  }

  Widget contentOrderSent() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 23, bottom: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Dikirim',
                style: orangeTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Text(
                'Pesanan Anda telah dikirim.',
                style: mutedTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Image.asset('assets/icon/sent.png')
        ],
      ),
    );
  }

  Widget contentOrderFinish() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 23, bottom: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Pesanan Selesai',
                style: orangeTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Text(
                'Terima kasih telah belanja di Locahubie.',
                style: mutedTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Image.asset('assets/icon/orderarrived.png')
        ],
      ),
    );
  }

  Widget contentOrderArrived() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 23, bottom: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Pesanan Sampai',
                style: orangeTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Text(
                'Silahkan cek dan terima pesanan Anda.',
                style: mutedTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Image.asset('assets/icon/orderarrived.png')
        ],
      ),
    );
  }

  Widget orderInformation(int payTotal) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Informasi Pesanan',
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Image.asset('assets/icon/see_invoice.png'),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Get.to(() {
                        return Invoice(
                          costCourier: widget.costCourier!,
                          totalPrice: widget.price!,
                          storeName: widget.storeName!,
                          orderan: widget.productName!,
                          timePay: widget.timeOrder!,
                          quantity: widget.quantity,
                          addressUser: widget.alamat!,
                          storeAddress: widget.addressStore!,
                          payTotal: payTotal,
                        );
                      });
                    },
                    child: Text(
                      'Lihat Invoice',
                      style: orangeTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 13),
          Divider(color: greyColor, height: 1, thickness: 1),
          const SizedBox(height: 19),
          Text(
            'Invoice',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                '${widget.invoice}',
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(width: 7),
              GestureDetector(
                  onTap: () {
                    FlutterClipboard.copy('${widget.invoice}')
                        .then((value) => print('copied'));
                  },
                  child: Row(
                    children: [
                      Image.asset('assets/icon/copy.png'),
                      const SizedBox(width: 7),
                      Text(
                        'Salin',
                        style: orangeTextStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ],
                  )),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'Waktu Pembelian',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                intl.DateFormat("dd MMMM yyyy HH:mm").format(
                  DateTime.parse(widget.timeOrder!),
                ),
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  bottomModal();
                },
                child: Text(
                  'Lihat Rincian Waktu',
                  style: orangeTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'Toko',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          Text(
            '${widget.storeName}',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 14),
          Text(
            'Metode Pembayaran',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          Text(
            'Midtrans',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 17),
        ],
      ),
    );
  }

  Widget shippingInformation() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Informasi Pengiriman',
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              if (widget.status == "dikirim") ...[
                GestureDetector(
                  onTap: () {
                    Get.to(() {
                      return const TrackingOrder();
                    });
                  },
                  child: Text(
                    'Selengkapnya >>',
                    style: orangeTextStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
              ]
            ],
          ),
          const SizedBox(height: 13),
          Divider(color: greyColor, height: 1, thickness: 1),
          const SizedBox(height: 19),
          Text(
            widget.resi != null
                ? '${widget.shippingService} - ${widget.resi}'
                : "${widget.shippingService}",
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          Text(
            '${widget.courier}'.toUpperCase(),
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          if (widget.status == "dikirim") ...[
            Row(
              children: [
                Image.asset('assets/icon/orderstatus.png'),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pesanan Dikirim',
                      style: orangeTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      intl.DateFormat("dd MMMM yyyy HH:mm").format(
                        DateTime.parse(widget.timeOrder!),
                      ),
                      style: mutedTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ],
          const SizedBox(height: 17),
        ],
      ),
    );
  }

  Widget shippingAddress() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Alamat Pengiriman',
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                onTap: () {
                  FlutterClipboard.copy('Jl. Patimura Block 2, Ambon, 97222')
                      .then((value) => print('copied'));
                },
                child: Row(
                  children: [
                    Image.asset('assets/icon/copy.png'),
                    const SizedBox(width: 7),
                    Text(
                      'Salin',
                      style: orangeTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Divider(color: greyColor, height: 1, thickness: 1),
          const SizedBox(height: 19),
          Text(
            'Alamat Rumah',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sry Mulyani Tosepu',
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Text(
                '   |   ',
                style: mutedTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Expanded(
                child: Text(
                  '082158454153',
                  style: darkTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          Text(
            'Jl. Patimura Block 2, Ambon, 97222',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 17),
        ],
      ),
    );
  }

  Widget product({totalPrice}) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Produk',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 13),
          Divider(color: greyColor, height: 1, thickness: 1),
          const SizedBox(height: 19),
          Row(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(widget.image!), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.productName}',
                      overflow: TextOverflow.ellipsis,
                      style: darkTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    // const SizedBox(height: 5),
                    // Text(
                    //   'Variasi: Kemasan 60Ml',
                    //   style: mutedTextStyle.copyWith(
                    //       fontSize: 12, fontWeight: FontWeight.w400),
                    // ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          overflow: TextOverflow.ellipsis,
                          TextSpan(
                            //apply style to all
                            children: [
                              TextSpan(
                                text: NumberFormat.currency(
                                  locale: "id_ID",
                                  name: "IDR",
                                  symbol: "Rp ",
                                  decimalDigits: 0,
                                ).format(widget.price),
                                style: darkTextStyle.copyWith(
                                    fontWeight: FontWeight.w700, fontSize: 14),
                              ),
                              const TextSpan(text: '  '),
                            ],
                          ),
                        ),
                        Text(
                          '${widget.quantity} pcs',
                          style: darkTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // const SizedBox(height: 18),
          // Row(
          //   children: [
          //     Container(
          //       width: 65,
          //       height: 65,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         image: const DecorationImage(
          //             image: AssetImage(
          //                 'assets/images/product/default_product.png'),
          //             fit: BoxFit.cover),
          //       ),
          //     ),
          //     const SizedBox(width: 10),
          //     Flexible(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'Otten Coffee - Flores Manggarai Robusta',
          //             overflow: TextOverflow.ellipsis,
          //             style: darkTextStyle.copyWith(
          //                 fontSize: 14, fontWeight: FontWeight.w400),
          //           ),
          //           const SizedBox(height: 5),
          //           Text(
          //             'Variasi: Kemasan 500gr',
          //             style: mutedTextStyle.copyWith(
          //                 fontSize: 12, fontWeight: FontWeight.w400),
          //           ),
          //           const SizedBox(height: 5),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text.rich(
          //                 overflow: TextOverflow.ellipsis,
          //                 TextSpan(
          //                   //apply style to all
          //                   children: [
          //                     TextSpan(
          //                       text: NumberFormat.currency(
          //                         locale: "id_ID",
          //                         name: "IDR",
          //                         symbol: "Rp ",
          //                         decimalDigits: 0,
          //                       ).format(120000),
          //                       style: darkTextStyle.copyWith(
          //                           fontWeight: FontWeight.w700, fontSize: 14),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Text(
          //                 '1 pcs',
          //                 style: darkTextStyle.copyWith(
          //                     fontSize: 14, fontWeight: FontWeight.w400),
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),

          const SizedBox(height: 16),
          Divider(color: greyColor, height: 1, thickness: 1),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Belanja',
                  style: darkTextStyle.copyWith(
                      fontWeight: FontWeight.w700, fontSize: 14)),
              Text(
                  NumberFormat.currency(
                    locale: "id_ID",
                    name: "IDR",
                    symbol: "Rp ",
                    decimalDigits: 0,
                  ).format(totalPrice),
                  style: darkTextStyle.copyWith(
                      fontWeight: FontWeight.w700, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 17),
        ],
      ),
    );
  }

  Widget customerNote() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Catatan Pembeli',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 13),
          Divider(color: greyColor, height: 1, thickness: 1),
          const SizedBox(height: 19),
          Text(
            'Usahakan cepat dikirim, karena 6 hari lagi saya harus keluar kota. Thanks :)',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 17),
        ],
      ),
    );
  }

  Widget totalPayment({totalPrice, payTotal}) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Total Pembayaran',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 13),
          Divider(color: greyColor, height: 1, thickness: 1),
          const SizedBox(height: 19),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Belanja',
                      style: darkTextStyle.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 14)),
                  Text('Diskon Belanja',
                      style: darkTextStyle.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 14)),
                  Text('Ongkos Kirim',
                      style: darkTextStyle.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 14)),
                  Text('Diskon Ongkos Kirim',
                      style: darkTextStyle.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 14)),
                  Text('Total Pembayaran',
                      style: darkTextStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 14)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    NumberFormat.currency(
                      locale: "id_ID",
                      name: "IDR",
                      symbol: "Rp ",
                      decimalDigits: 0,
                    ).format(totalPrice),
                    style: darkTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: "id_ID",
                      name: "IDR",
                      symbol: "- Rp ",
                      decimalDigits: 0,
                    ).format(0),
                    style: darkTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: "id_ID",
                      name: "IDR",
                      symbol: "Rp ",
                      decimalDigits: 0,
                    ).format(widget.costCourier),
                    style: darkTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: "id_ID",
                      name: "IDR",
                      symbol: "- Rp ",
                      decimalDigits: 0,
                    ).format(0),
                    style: darkTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: "id_ID",
                      name: "IDR",
                      symbol: "Rp ",
                      decimalDigits: 0,
                    ).format(payTotal),
                    style: darkTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 17),
        ],
      ),
    );
  }

  Widget buttons() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 25, bottom: 50),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 43,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: greyColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icon/message.png'),
                  const SizedBox(width: 12),
                  Text(
                    'Hubungi Penjual',
                    style: darkTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              onPressed: () {
                //  Get.to(() {
                //         return const NotYetPaid();
                //       });
              },
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 43,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: greyColor),
              child: Text(
                widget.status == "selesai"
                    ? 'Beri Penilaian'
                    : 'Ajukan Pengembalian',
                style: widget.status == "dikirim" || widget.status == "selesai"
                    ? darkTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w700)
                    : mutedTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w700),
              ),
              onPressed: () {
                //  Get.to(() {
                //         return const NotYetPaid();
                //       });
              },
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 43,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: greyColor),
              child: Text(
                widget.status == "selesai" ? 'Beli Lagi' : 'Pesanan Sampai',
                style: widget.status == "dikirim" || widget.status == "selesai"
                    ? darkTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w700)
                    : mutedTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w700),
              ),
              onPressed: () {
                //  Get.to(() {
                //         return const NotYetPaid();
                //       });
              },
            ),
          ),
        ],
      ),
    );
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
          //padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          height: 250,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: whiteColor,
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Rincian Waktu',
                    style: darkTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Waktu Pembelian',
                            style: darkTextStyle.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 14)),
                        // Text('Waktu Pembayaran',
                        //     style: darkTextStyle.copyWith(
                        //         fontWeight: FontWeight.w400, fontSize: 14)),
                        // Text('Waktu Dikirim',
                        //     style: darkTextStyle.copyWith(
                        //         fontWeight: FontWeight.w400, fontSize: 14)),
                        // Text('Waktu Pesanan Sampai',
                        //     style: darkTextStyle.copyWith(
                        //         fontWeight: FontWeight.w400, fontSize: 14)),
                        // Text('Waktu Pesanan Diterima',
                        //     style: darkTextStyle.copyWith(
                        //         fontWeight: FontWeight.w400, fontSize: 14)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            intl.DateFormat("dd MMMM yyyy HH:mm").format(
                              DateTime.parse(widget.timeOrder!),
                            ),
                            style: darkTextStyle.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 14)),
                        // Text('22 Agustus 2021 10:00',
                        //     style: darkTextStyle.copyWith(
                        //         fontWeight: FontWeight.w400, fontSize: 14)),
                        // Text('22 Agustus 2021 16:30',
                        //     style: darkTextStyle.copyWith(
                        //         fontWeight: FontWeight.w400, fontSize: 14)),
                        // Text('25 Agustus 2021 09:20',
                        //     style: darkTextStyle.copyWith(
                        //         fontWeight: FontWeight.w400, fontSize: 14)),
                        // Text('25 Agustus 2021 13:15',
                        //     style: darkTextStyle.copyWith(
                        //         fontWeight: FontWeight.w400, fontSize: 14)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
