import 'package:flutter/material.dart';
import 'package:locahub/core/views/checkout/checkout_2/view/checkout_2_view.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/voucher/view/detail_promo.dart';

class PromoList extends StatefulWidget {
  const PromoList({super.key});

  @override
  State<PromoList> createState() => _PromoListState();
}

class _PromoListState extends State<PromoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        //normalnya 56
        toolbarHeight: 154,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
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
                  "Pakai Promo",
                  style: darkTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Container(margin: const EdgeInsets.only(left: 40)),
              ],
            ),
            const SizedBox(height: 27),
            Row(
              children: [
                searchBar(),
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 107,
                  height: 43,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: greyColor),
                    child: Text(
                      'Gunakan',
                      style: mutedTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    onPressed: () {
                      //deliveryModal();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          content(),
        ],
      ),
      bottomNavigationBar: bottomButton(),
    );
  }

  Widget searchBar() {
    return Expanded(
      child: Container(
        height: 43,
        margin: const EdgeInsets.only(left: 8, right: 8),
        child: TextFormField(
          textInputAction: TextInputAction.go,
          onFieldSubmitted: (value) {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (_) {
            //       return const SearchResultPage();
            //     },
            //   ),
            // );
          },
          decoration: InputDecoration(
            fillColor: blackColor.withOpacity(0.05),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: blackColor.withOpacity(0.05)),
            ),
            contentPadding: const EdgeInsets.only(top: 16, left: 16),
            hintText: 'Kode Voucher',
            hintStyle: mutedTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  Widget bottomButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 22, top: 22, left: 24, right: 24),
      width: double.infinity,
      height: 43,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: orangeColor),
        child: Text(
          'Selesai',
          style: whiteTextStyle.copyWith(fontSize: 14),
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) {
                return const Checkout2View();
              },
            ),
          );
        },
      ),
    );
  }

  Widget content() {
    return Column(
      children: const <Widget>[
        PromoCard(
          name: 'MERDEKA1708',
          description:
              'Dapatkan diskon 30% sampai dengan Rp 35.000,- dari setiap belanja Anda, dapat digunakan pada toko official dengan minimal transaksi diatas Rp 200.000,-',
        ),
        PromoCard(
          name: 'MERDEKA1708',
          description:
              'Dapatkan diskon 30% sampai dengan Rp 35.000,- dari setiap belanja Anda, dapat digunakan pada toko official dengan minimal transaksi diatas Rp 200.000,-',
        ),
        PromoCard(
          name: 'MERDEKA1708',
          description:
              'Dapatkan diskon 30% sampai dengan Rp 35.000,- dari setiap belanja Anda, dapat digunakan pada toko official dengan minimal transaksi diatas Rp 200.000,-',
        ),
        PromoCard(
          name: 'MERDEKA1708',
          description:
              'Dapatkan diskon 30% sampai dengan Rp 35.000,- dari setiap belanja Anda, dapat digunakan pada toko official dengan minimal transaksi diatas Rp 200.000,-',
        ),
      ],
    );
  }
}

class PromoCard extends StatelessWidget {
  final String name;
  final String code;
  final String description;

  const PromoCard({
    super.key,
    required this.name,
    this.code = '',
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return const DetailPromo();
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: darkTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              style: mutedTextStyle.copyWith(
                  fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            Divider(thickness: 1, color: greyColor),
          ],
        ),
      ),
    );
  }
}
