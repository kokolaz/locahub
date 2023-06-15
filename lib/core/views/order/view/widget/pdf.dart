import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

Future<void> generatePdf() async {
  final pdf = pw.Document();

  // Create an instance of the Invoice class
  // const invoice = Invoice();

  // Add content to the PDF document
  pdf.addPage(pw.Page(
    build: (context) => pw.Center(child: pw.Text('invoice')),
  ));
  // Save the PDF document to a file
  final file = await File('invoice.pdf').create();
  await file.writeAsBytes(await pdf.save());
}
