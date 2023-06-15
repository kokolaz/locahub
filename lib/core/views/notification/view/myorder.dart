import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
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
            "Pesanan Saya",
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
          title: 'Pesanan Disiapkan Oleh Penjual',
          code: 'ID18082021133100001',
          description: 'xxx',
          date: '10 September 2021 13:31',
        ),
        PromotionCard(
          title: 'Pesanan Diterima',
          code: 'ID18082021133100001',
          description: 'xxx',
          date: '10 September 2021 13:31',
        ),
        PromotionCard(
          title: 'Pesanan Diterima',
          code: 'ID18082021133100001',
          description: 'xxx',
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
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              text: code,
                              style: orangeTextStyle.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: ' • ',
                              style: mutedTextStyle.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: date,
                              style: mutedTextStyle.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) {
                    //       return const MidtransPage();
                    //     },
                    //   ),
                    // );
                  },
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: darkgreyColor,
                    size: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              description,
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
