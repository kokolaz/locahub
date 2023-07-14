import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart' as intl;

pw.Document generatePdf(
    {timePay,
    storeName,
    storeAddress,
    orderan,
    quantity,
    totalPrice,
    costCourier,
    payTotal}) {
  final pdf = pw.Document();

  // Create an instance of the Invoice class
  // const invoice = Invoice();
  pw.TextStyle darkTextStyleBold = pw.TextStyle(
    // fontWeight: pw.FontWeight.,
    fontWeight: pw.FontWeight.bold,
    fontSize: 10,
  );
  pw.TextStyle darkTextStyleReguler = const pw.TextStyle(
    // fontWeight: pw.FontWeight.,
    fontSize: 10,
  );
  PdfColor greyColor = PdfColor.fromHex('#E9E9E9');

  // Add content to the PDF document
  pdf.addPage(pw.Page(
    build: (context) => pw.ListView(children: [
      first(darkTextStyleBold, timePay, darkTextStyleReguler, storeName,
          storeAddress),
      second(darkTextStyleBold, greyColor, orderan, darkTextStyleReguler,
          quantity, totalPrice, costCourier, payTotal)
    ]),
  ));
  // Save the PDF document to a file
  // final file = await File('invoice.pdf').create();
  // await file.writeAsBytes(await pdf.save());
  return pdf;
}

pw.Container second(
    pw.TextStyle darkTextStyleBold,
    PdfColor greyColor,
    orderan,
    pw.TextStyle darkTextStyleReguler,
    quantity,
    totalPrice,
    costCourier,
    payTotal) {
  return pw.Container(
    padding: const pw.EdgeInsets.only(right: 24, left: 24, top: 12),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Rincian Pesanan', style: darkTextStyleBold),
        pw.SizedBox(height: 14),
        pw.Divider(color: greyColor, height: 1, thickness: 1),
        pw.SizedBox(height: 14),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(orderan, style: darkTextStyleReguler),
                //pw. Text('Variasi: Kemasan 500gr',
                //     style: mutedTextStyle.copyWith(
                //         fontWeight: FontWeight.w400, fontSize: 10)),
              ],
            ),
          ),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Text('x $quantity pcs', style: darkTextStyleReguler),
              pw.Text(
                intl.NumberFormat.currency(
                  locale: "id_ID",
                  name: "IDR",
                  symbol: "Rp ",
                  decimalDigits: 0,
                ).format(totalPrice * quantity!),
                style: darkTextStyleReguler,
                overflow: pw.TextOverflow.span,
              ),
            ],
          )
        ]),
        pw.SizedBox(height: 14),
        pw.Divider(color: greyColor, height: 1, thickness: 1),
        pw.SizedBox(height: 14),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Total Belanja', style: darkTextStyleReguler),
                pw.Text('Diskon Belanja', style: darkTextStyleReguler),
                pw.Text('Ongkos Kirim', style: darkTextStyleReguler),
                pw.Text('Diskon Ongkos Kirim', style: darkTextStyleReguler),
                pw.Text('Total Pembayaran', style: darkTextStyleBold),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text(
                    intl.NumberFormat.currency(
                      locale: "id_ID",
                      name: "IDR",
                      symbol: "Rp ",
                      decimalDigits: 0,
                    ).format(totalPrice * quantity!),
                    style: darkTextStyleReguler),
                pw.Text(
                    intl.NumberFormat.currency(
                      locale: "id_ID",
                      name: "IDR",
                      symbol: "- Rp ",
                      decimalDigits: 0,
                    ).format(0),
                    style: darkTextStyleReguler),
                pw.Text(
                    intl.NumberFormat.currency(
                      locale: "id_ID",
                      name: "IDR",
                      symbol: "Rp ",
                      decimalDigits: 0,
                    ).format(costCourier),
                    style: darkTextStyleReguler),
                pw.Text(
                    intl.NumberFormat.currency(
                      locale: "id_ID",
                      name: "IDR",
                      symbol: "Rp ",
                      decimalDigits: 0,
                    ).format(0),
                    style: darkTextStyleReguler),
                pw.Text(
                    intl.NumberFormat.currency(
                      locale: "id_ID",
                      name: "IDR",
                      symbol: "Rp ",
                      decimalDigits: 0,
                    ).format(payTotal),
                    style: darkTextStyleBold)
              ],
            )
          ],
        ),
      ],
    ),
  );
}

pw.Container first(pw.TextStyle darkTextStyleBold, timePay,
    pw.TextStyle darkTextStyleReguler, storeName, storeAddress) {
  return pw.Container(
    padding: const pw.EdgeInsets.only(right: 24, left: 24, top: 16),
    child: pw.Column(
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: <pw.Widget>[
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Waktu Pembayaran', style: darkTextStyleBold),
                  pw.Text(
                      intl.DateFormat("dd MMMM yyyy HH:mm").format(
                        DateTime.parse(timePay),
                      ),
                      style: darkTextStyleReguler),
                  pw.SizedBox(height: 14),
                  pw.Text('Toko', style: darkTextStyleBold),
                  pw.Text('(+62) 812 3456 7890', style: darkTextStyleReguler),
                  pw.Text(storeName, style: darkTextStyleReguler),
                  pw.Text(storeAddress, style: darkTextStyleReguler)
                ],
              ),
            ),
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Metode Pembayaran', style: darkTextStyleBold),
                  pw.Text('Midtrans', style: darkTextStyleReguler),
                  pw.SizedBox(height: 14),
                  pw.Text('Pengiriman', style: darkTextStyleBold),
                  pw.Text('(+62) 857 5505 5835 ', style: darkTextStyleReguler),
                  pw.Text('Eris Dwi Septiawan Rizal',
                      style: darkTextStyleReguler),
                  pw.Text(
                      ' Jl. Trunojoyo No. 89, Lombok Kulon, Wonosari, Kabupaten Bondowoso, Jawa Timur. 68282.',
                      style: darkTextStyleBold)
                ],
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 19),
      ],
    ),
  );
}

void saveAndDownloadPdf(
    {storeAddress,
    storeName,
    timePay,
    costCourier,
    orderan,
    payTotal,
    quantity,
    totalPrice}) {
  final pdf = generatePdf(
      storeAddress: storeAddress,
      storeName: storeName,
      timePay: timePay,
      costCourier: costCourier,
      orderan: orderan,
      payTotal: payTotal,
      quantity: quantity,
      totalPrice: totalPrice);

  Printing.layoutPdf(
    onLayout: (format) => pdf.save(),
  );
}
