import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' as intl;
import 'package:locahub/core/views/order/view/widget/pdf.dart';

class Invoice extends StatefulWidget {
  const Invoice(
      {super.key,
      required this.timePay,
      required this.storeName,
      required this.storeAddress,
      required this.addressUser,
      required this.orderan,
      required this.totalPrice,
      required this.costCourier,
      this.quantity,
      required this.payTotal});
  final String timePay;
  final String storeName;
  final String storeAddress;
  final String addressUser;
  final String orderan;
  final int? quantity;
  final int totalPrice;
  final int costCourier;
  final int payTotal;
  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: const EdgeInsets.only(left: 12),
              alignment: Alignment.centerLeft,
              icon: Icon(
                Icons.arrow_back_ios,
                color: darkgreyColor,
                size: 14,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Text(
              "Invoice",
              style: darkTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
            InkWell(
              onTap: () async {
                await generatePdf();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Image.asset('assets/icon/invoice.png',
                    alignment: Alignment.centerRight),
              ),
            ),
            // InkWell(
            //   onTap: () {},
            //   child: Padding(
            //     padding: const EdgeInsets.only(right: 12),
            //     child: Image.asset('assets/icon/invoice.png',
            //         alignment: Alignment.centerRight),
            //   ),
            // ),
          ],
        ),
      ),
      body: ListView(
        children: [
          greyContainer(),
          content(),
          greyContainer(),
          orderDetail(),
        ],
      ),
    );
  }

  Widget greyContainer() {
    return Container(
      height: 9,
      color: lightgreyColor,
    );
  }

  Widget content() {
    return Container(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Waktu Pembayaran',
                        style: darkTextStyle.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 10)),
                    Text(
                        intl.DateFormat("dd MMMM yyyy HH:mm").format(
                          DateTime.parse(widget.timePay),
                        ),
                        style: darkTextStyle.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 10)),
                    const SizedBox(height: 14),
                    Text('Toko',
                        style: darkTextStyle.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 10)),
                    Text('(+62) 812 3456 7890',
                        style: darkTextStyle.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 10)),
                    Text(widget.storeName,
                        style: darkTextStyle.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 10)),
                    Text(widget.storeAddress,
                        style: darkTextStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Metode Pembayaran',
                        style: darkTextStyle.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 10)),
                    Text('Midtrans',
                        style: darkTextStyle.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 10)),
                    const SizedBox(height: 14),
                    Text('Pengiriman',
                        style: darkTextStyle.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 10)),
                    Text('(+62) 857 5505 5835 ',
                        style: darkTextStyle.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 10)),
                    Text('Eris Dwi Septiawan Rizal',
                        style: darkTextStyle.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 10)),
                    Text(
                        ' Jl. Trunojoyo No. 89, Lombok Kulon, Wonosari, Kabupaten Bondowoso, Jawa Timur. 68282.',
                        style: darkTextStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 19),
        ],
      ),
    );
  }

  Widget orderDetail() {
    return Container(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rincian Pesanan',
              style: darkTextStyle.copyWith(
                  fontWeight: FontWeight.w700, fontSize: 10)),
          const SizedBox(height: 14),
          Divider(color: greyColor, height: 1, thickness: 1),
          const SizedBox(height: 14),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.orderan,
                      style: darkTextStyle.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 10)),
                  // Text('Variasi: Kemasan 500gr',
                  //     style: mutedTextStyle.copyWith(
                  //         fontWeight: FontWeight.w400, fontSize: 10)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('x ${widget.quantity} pcs',
                    style: darkTextStyle.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 10)),
                Text.rich(
                  overflow: TextOverflow.ellipsis,
                  TextSpan(
                    style: poppinsTextStyle.copyWith(
                        fontSize: 10), //apply style to all
                    children: [
                      TextSpan(
                        text: NumberFormat.currency(
                          locale: "id_ID",
                          name: "IDR",
                          symbol: "Rp ",
                          decimalDigits: 0,
                        ).format(widget.totalPrice * widget.quantity!),
                        style: darkTextStyle.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ]),
          const SizedBox(height: 14),
          Divider(color: greyColor, height: 1, thickness: 1),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Belanja',
                      style: darkTextStyle.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 10)),
                  Text('Diskon Belanja',
                      style: darkTextStyle.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 10)),
                  Text('Ongkos Kirim',
                      style: darkTextStyle.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 10)),
                  Text('Diskon Ongkos Kirim',
                      style: darkTextStyle.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 10)),
                  Text('Total Pembayaran',
                      style: darkTextStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 10)),
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
                    ).format(widget.totalPrice * widget.quantity!),
                    style: darkTextStyle.copyWith(
                      fontSize: 10,
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
                      fontSize: 10,
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
                      fontSize: 10,
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
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: "id_ID",
                      name: "IDR",
                      symbol: "Rp ",
                      decimalDigits: 0,
                    ).format(widget.payTotal),
                    style: darkTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
