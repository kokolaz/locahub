import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';

class StoreInformationDetail extends StatefulWidget {
  const StoreInformationDetail({super.key});

  @override
  State<StoreInformationDetail> createState() => _StoreInformationDetailState();
}

class _StoreInformationDetailState extends State<StoreInformationDetail> {
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
            "Informasi Toko",
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
            'Bergabung Pada',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 14),
          Text(
            '1 Agustus 2021',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 24),
          Text(
            'Deskripsi Toko',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 14),
          Text(
            'Kios Kopi Floratama merupakan toko kopi yang paling lengkap di NTT dengan berbagai varian dan jenis kopi dari seluruh daerah di Indonesia.',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 24),
          Text(
            'Catatan Toko',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 14),
          Text(
            'Pengiriman di hari yang sama harus melakukan pembayaran sebelum 15.00 dan barang akan dikirim hari itu juga. Apabila melebihi jam 15.00 barang akan dikirim keesokan harinya.\n\nTolong berikan catatan apabila barang yang dipesan memiliki kriteria khusus seperti warna, ukuran, dll.\n\nSyarat untuk pengembalian barang wajib menyertakan video unboxing paket yang diterima dan barang rusak bukan karena human error.',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 24),
          Text(
            'Jadwal Operasional Toko',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 14),
          operationalSchedule(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget operationalSchedule() {
    return Column(
      children: const [
        OperationalScheduleCard(day: 'Senin', time: '08.00 - 17.00'),
        OperationalScheduleCard(day: 'Selasa', time: '08.00 - 17.00'),
        OperationalScheduleCard(day: 'Rabu', time: '08.00 - 17.00'),
        OperationalScheduleCard(day: 'Kamis', time: '08.00 - 17.00'),
        OperationalScheduleCard(
            day: 'Jumat', time: '08.00 - 11.00 & 13.00 - 17.00'),
        OperationalScheduleCard(day: 'Sabtu', time: '09.00 - 14.00'),
        OperationalScheduleCard(day: 'Minggu', time: 'Libur')
      ],
    );
  }
}

class OperationalScheduleCard extends StatelessWidget {
  final String day;
  final String time;

  const OperationalScheduleCard(
      {super.key, required this.day, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                day,
                style: darkTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: darkTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
