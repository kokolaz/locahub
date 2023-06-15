import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:locahub/core/views/order/view/widget/timeline_order.dart';
import 'package:locahub/core/views/global/theme.dart';

class TrackingOrder extends StatefulWidget {
  const TrackingOrder({super.key});

  @override
  State<TrackingOrder> createState() => _TrackingOrderState();
}

class _TrackingOrderState extends State<TrackingOrder> {
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
            "Lacak Pesanan",
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
            const TimelineOrder(),
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
      padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'J&T Express (Reguler)',
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
              GestureDetector(
                onTap: () {
                  FlutterClipboard.copy('JP6324376298')
                      .then((value) => print('copied'));
                },
                child: Row(
                  children: [
                    Image.asset('assets/icon/copy.png'),
                    const SizedBox(width: 7),
                    Text(
                      'JP6324376298',
                      style: orangeTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Divider(color: greyColor, height: 1, thickness: 1),
          const SizedBox(height: 19),
        ],
      ),
    );
  }
}
