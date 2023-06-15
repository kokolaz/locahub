import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';

class PromotionPage extends StatefulWidget {
  const PromotionPage({super.key});

  @override
  State<PromotionPage> createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
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
            "Promo",
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
      margin: const EdgeInsets.only(bottom: 6),
      height: 9,
      color: lightgreyColor,
    );
  }

  Widget content() {
    return Column(
      children: const <Widget>[
        PromotionCard(
          name: 'Cashback 20% di Bulan September',
          description:
              'Gunakan kode voucher SEP2021 dapatkan cashback sebesar 20% sd Rp 10.000 dengan pembelian minimal Rp 50.000.',
          date: '10 September 2021 13:31',
        ),
        PromotionCard(
          name: 'Cashback 20% di Bulan September',
          description:
              'Gunakan kode voucher SEP2021 dapatkan cashback sebesar 20% sd Rp 10.000 dengan pembelian minimal Rp 50.000.',
          date: '10 September 2021 13:31',
        ),
        PromotionCard(
          name: 'Cashback 20% di Bulan September',
          description:
              'Gunakan kode voucher SEP2021 dapatkan cashback sebesar 20% sd Rp 10.000 dengan pembelian minimal Rp 50.000.',
          date: '10 September 2021 13:31',
        ),
        PromotionCard(
          name: 'Cashback 20% di Bulan September',
          description:
              'Gunakan kode voucher SEP2021 dapatkan cashback sebesar 20% sd Rp 10.000 dengan pembelian minimal Rp 50.000.',
          date: '10 September 2021 13:31',
        ),
        PromotionCard(
          name: 'Cashback 20% di Bulan September',
          description:
              'Gunakan kode voucher SEP2021 dapatkan cashback sebesar 20% sd Rp 10.000 dengan pembelian minimal Rp 50.000.',
          date: '10 September 2021 13:31',
        ),
        PromotionCard(
          name: 'Cashback 20% di Bulan September',
          description:
              'Gunakan kode voucher SEP2021 dapatkan cashback sebesar 20% sd Rp 10.000 dengan pembelian minimal Rp 50.000.',
          date: '10 September 2021 13:31',
        ),
      ],
    );
  }
}

class PromotionCard extends StatelessWidget {
  final String name;
  final String date;
  final String description;

  const PromotionCard({
    super.key,
    required this.name,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (_) {
        //       return const DetailPromo();
        //     },
        //   ),
        // );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            Text(
              name,
              style: darkTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: darkTextStyle.copyWith(
                  fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 5),
            Text(
              date,
              style: mutedTextStyle.copyWith(
                  fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            Divider(thickness: 1, color: greyColor),
          ],
        ),
      ),
    );
  }
}
