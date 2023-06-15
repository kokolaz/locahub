import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:intl/intl.dart';
import 'package:clipboard/clipboard.dart';

class Canceled extends StatefulWidget {
  const Canceled({super.key});

  @override
  State<Canceled> createState() => _CanceledState();
}

class _CanceledState extends State<Canceled> {
  @override
  Widget build(BuildContext context) {
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
            content(),
            greyContainer(),
            orderInformation(),
            greyContainer(),
            shippingInformation(),
            greyContainer(),
            shippingAddress(),
            greyContainer(),
            product(),
            greyContainer(),
            customerNote(),
            greyContainer(),
            totalPayment(),
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

  Widget content() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 23, bottom: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Dibatalkan',
                style: orangeTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Text(
                'Pesanan Anda dibatalkan',
                style: mutedTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Image.asset('assets/icon/packed.png')
        ],
      ),
    );
  }

  Widget orderInformation() {
    // TextEditingController field = TextEditingController();
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Informasi Pesanan',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
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
                'INV20210827113500010',
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(width: 7),
              GestureDetector(
                  onTap: () {
                    FlutterClipboard.copy('INV20210827113500010')
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
            'Dibatalkan pada',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          Text(
            '22 Agustus 2021 10:00',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 14),
          Text(
            'Toko',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          Text(
            'Kios Kopi Floratama',
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
          Text(
            'Informasi Pengiriman',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 13),
          Divider(color: greyColor, height: 1, thickness: 1),
          const SizedBox(height: 19),
          Text(
            'Pengiriman Reguler',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
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
                  FlutterClipboard.copy(
                          'Jl. Trunojoyo No. 89, Lombok Kulon, Wonosari, Kabupaten Bondowoso, Jawa Timur. 68282.')
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
                'Eris Dwi Septiawan Rizal',
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
                  '+62 857 5505 5835',
                  style: darkTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          Text(
            'Jl. Trunojoyo No. 89, Lombok Kulon, Wonosari, Kabupaten Bondowoso, Jawa Timur. 68282.',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 17),
        ],
      ),
    );
  }

  Widget product() {
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
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/product/default_product.png'),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Otten Coffee - Flores Manggarai Kopi Arabica',
                      overflow: TextOverflow.ellipsis,
                      style: darkTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Variasi: Kemasan 500gr',
                      style: mutedTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
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
                                ).format(150000),
                                style: darkTextStyle.copyWith(
                                    fontWeight: FontWeight.w700, fontSize: 14),
                              ),
                              const TextSpan(text: '  '),
                              TextSpan(
                                text: NumberFormat.currency(
                                  locale: "id_ID",
                                  name: "IDR",
                                  symbol: "Rp ",
                                  decimalDigits: 0,
                                ).format(160000),
                                style: mutedTextStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '1 pcs',
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
          const SizedBox(height: 18),
          Row(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/product/default_product.png'),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Otten Coffee - Flores Manggarai Robusta',
                      overflow: TextOverflow.ellipsis,
                      style: darkTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Variasi: Kemasan 500gr',
                      style: mutedTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
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
                                ).format(120000),
                                style: darkTextStyle.copyWith(
                                    fontWeight: FontWeight.w700, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '1 pcs',
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
                  ).format(270000),
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

  Widget totalPayment() {
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
                    ).format(270000),
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
                    ).format(20000),
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
                    ).format(26000),
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
                    ).format(296000),
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
                  backgroundColor: orangeColor),
              child: Text(
                'Beli Lagi',
                style: whiteTextStyle.copyWith(
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
}
