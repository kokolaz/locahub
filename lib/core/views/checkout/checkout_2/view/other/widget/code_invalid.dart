import 'package:flutter/material.dart';
import 'package:locahub/core/views/checkout/checkout_2/view/other/checkout.dart';
import 'package:locahub/core/views/global/theme.dart';

class CodeInvalid extends StatefulWidget {
  const CodeInvalid({super.key});

  @override
  State<CodeInvalid> createState() => _CodeInvalidState();
}

class _CodeInvalidState extends State<CodeInvalid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        //normalnya 56
        toolbarHeight: 181,
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
                        backgroundColor: orangeColor),
                    child: Text(
                      'Gunakan',
                      style: whiteTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    onPressed: () {
                      //deliveryModal();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            invalidFlag(),
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
              borderSide: BorderSide(color: redColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: redColor),
            ),
            contentPadding: const EdgeInsets.only(top: 16, left: 16),
            hintText: 'HBN',
            hintStyle: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  Widget invalidFlag() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Image.asset("assets/icon/red_warning.png"),
          const SizedBox(width: 7),
          Text(
            "Voucher tidak valid",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 12, color: redColor),
          ),
        ],
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
                return const CheckoutPage();
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
        HomeAddress(
          name: 'Gajian Seru',
          code: 'GAJIANSERU',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum consequat pellentesque egestas. Fusce varius ligula ipsum.',
        ),
        HomeAddress(
          name: 'Gajian Seru',
          code: 'GAJIANSERU',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum consequat pellentesque egestas. Fusce varius ligula ipsum.',
        ),
        HomeAddress(
          name: 'Gajian Seru',
          code: 'GAJIANSERU',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum consequat pellentesque egestas. Fusce varius ligula ipsum.',
        ),
        HomeAddress(
          name: 'Gajian Seru',
          code: 'GAJIANSERU',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum consequat pellentesque egestas. Fusce varius ligula ipsum.',
        ),
        HomeAddress(
          name: 'Gajian Seru',
          code: 'GAJIANSERU',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum consequat pellentesque egestas. Fusce varius ligula ipsum.',
        ),
      ],
    );
  }
}

class HomeAddress extends StatelessWidget {
  final String name;
  final String code;
  final String description;

  const HomeAddress({
    super.key,
    required this.name,
    this.code = '-',
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Kode Promo: ',
                  style: darkTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
                TextSpan(
                  text: code,
                  style: orangeTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: darkTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 14),
          Divider(thickness: 1, color: greyColor),
        ],
      ),
    );
  }
}
