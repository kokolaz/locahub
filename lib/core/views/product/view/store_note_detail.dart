import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';

class StoreNote extends StatefulWidget {
  const StoreNote({super.key, required this.storeNote});
  final String storeNote;
  @override
  State<StoreNote> createState() => _StoreNoteState();
}

class _StoreNoteState extends State<StoreNote> {
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
            "Catatan Toko",
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
      padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.storeNote,
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          // Text(
          //   'Jadwal Pengiriman',
          //   style: darkTextStyle.copyWith(
          //       fontSize: 14, fontWeight: FontWeight.w700),
          // ),
          // const SizedBox(height: 5),
          // Text(
          //   'Pengiriman barang di luar Minuman Botol (cek deskripsi) hanya dilakukan pada hari Senin - Jumat. Di hari Sabtu & Minggu untuk pengriiman barang hanya dapat menggunakan (Khusus Kurir Instant / Sameday)\n',
          //   style: darkTextStyle.copyWith(
          //       fontSize: 14, fontWeight: FontWeight.w400),
          // ),
          // Text(
          //   'Facebook',
          //   style: darkTextStyle.copyWith(
          //       fontSize: 14, fontWeight: FontWeight.w700),
          // ),
          // const SizedBox(height: 5),
          // Text(
          //   'www.facebook.com/kioskopi.malang\n',
          //   style: darkTextStyle.copyWith(
          //       fontSize: 14, fontWeight: FontWeight.w400),
          // ),
          // Text(
          //   'Youtube',
          //   style: darkTextStyle.copyWith(
          //       fontSize: 14, fontWeight: FontWeight.w700),
          // ),
          // const SizedBox(height: 5),
          // Text(
          //   'www.youtube.com/kioskopi.malang',
          //   style: darkTextStyle.copyWith(
          //       fontSize: 14, fontWeight: FontWeight.w400),
          // ),
        ],
      ),
    );
  }
}
