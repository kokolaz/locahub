import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';

class MidtransPage extends StatefulWidget {
  const MidtransPage({super.key});

  @override
  State<MidtransPage> createState() => _MidtransPageState();
}

class _MidtransPageState extends State<MidtransPage> {
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
            "Midtrans",
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
          title: 'Pembayaran Berhasil',
          code: 'ID18082021133100001',
          description:
              ' telah berhasil. Saldo Anda terpotong sebesar Rp 296.000.',
          date: '10 September 2021 13:31',
        ),
        PromotionCard(
          title: 'Pembayaran Berhasil',
          code: 'ID18082021133100001',
          description:
              ' telah berhasil. Saldo Anda terpotong sebesar Rp 296.000.',
          date: '10 September 2021 13:31',
        ),
        PromotionCard(
          title: 'Pembayaran Berhasil',
          code: 'ID18082021133100001',
          description:
              ' telah berhasil. Saldo Anda terpotong sebesar Rp 296.000.',
          date: '10 September 2021 13:31',
        ),
        PromotionCard(
          title: 'Pembayaran Berhasil',
          code: 'ID18082021133100001',
          description:
              ' telah berhasil. Saldo Anda terpotong sebesar Rp 296.000.',
          date: '10 September 2021 13:31',
        ),
        PromotionCard(
          title: 'Pembayaran Berhasil',
          code: 'ID18082021133100001',
          description:
              ' telah berhasil. Saldo Anda terpotong sebesar Rp 296.000.',
          date: '10 September 2021 13:31',
        ),
        PromotionCard(
          title: 'Pembayaran Berhasil',
          code: 'ID18082021133100001',
          description:
              ' telah berhasil. Saldo Anda terpotong sebesar Rp 296.000.',
          date: '10 September 2021 13:31',
        ),
      ],
    );
  }
}

class PromotionCard extends StatelessWidget {
  final String title;
  final String code;
  final String date;
  final String description;

  const PromotionCard({
    super.key,
    required this.title,
    required this.code,
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
              title,
              style: darkTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 5),
            Text.rich(
              TextSpan(
                style: poppinsTextStyle.copyWith(
                    fontSize: 12), //apply style to all
                children: [
                  TextSpan(
                      text: 'Pembayaran pada transaksi ',
                      style: darkTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: code,
                      style: orangeTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: description,
                      style: darkTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400))
                ],
              ),
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
