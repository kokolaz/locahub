import 'package:flutter/material.dart';
import 'package:locahub/core/views/notification/view/midtrans.dart';
import 'package:locahub/core/views/notification/view/myorder.dart';
import 'package:locahub/core/views/notification/view/promotion.dart';
import 'package:locahub/core/views/global/theme.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
            "Pemberitahuan",
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
    return Column(
      children: <Widget>[
        myOrder(),
        greyContainer(),
        midtrans(),
        greyContainer(),
        promotion(),
        greyContainer(),
      ],
    );
  }

  Widget myOrder() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
      child: Row(
        children: [
          Image.asset('assets/icon/myorder.png', width: 28),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pesanan Saya',
                //overflow: TextOverflow.ellipsis,
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Text(
                '2 belum terbaca',
                //overflow: TextOverflow.ellipsis,
                style: orangeTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return const MyOrderPage();
                  },
                ),
              );
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: darkgreyColor,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget midtrans() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
      child: Row(
        children: [
          Image.asset('assets/images/logo/midtrans.png', width: 28),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Midtrans',
                //overflow: TextOverflow.ellipsis,
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Text(
                'Tidak ada pemberitahuan baru.',
                //overflow: TextOverflow.ellipsis,
                style: mutedTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return const MidtransPage();
                  },
                ),
              );
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: darkgreyColor,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget promotion() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
      child: Row(
        children: [
          Image.asset('assets/icon/promotion.png', width: 28),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Promo',
                //overflow: TextOverflow.ellipsis,
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Text(
                'Tidak ada pemberitahuan baru.',
                //overflow: TextOverflow.ellipsis,
                style: mutedTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return const PromotionPage();
                  },
                ),
              );
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: darkgreyColor,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}
