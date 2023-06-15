import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:intl/intl.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
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
            "Penilaian Anda",
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
      margin: const EdgeInsets.only(bottom: 21),
      height: 9,
      color: lightgreyColor,
    );
  }

  Widget content() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/product/default_product.png'),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Otten Coffee - Flores Manggarai Kopi Arabica',
                      overflow: TextOverflow.ellipsis,
                      style: darkTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 5),
                    Text.rich(
                      overflow: TextOverflow.ellipsis,
                      TextSpan(
                        //apply style to all
                        children: [
                          TextSpan(
                            text: NumberFormat.currency(
                              locale: "id_ID",
                              name: "IDR",
                              symbol: "Rp ",
                              decimalDigits: 0,
                            ).format(150000),
                            style: darkTextStyle.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                          const TextSpan(text: '  '),
                          TextSpan(
                            text: NumberFormat.currency(
                              locale: "id_ID",
                              name: "IDR",
                              symbol: "Rp ",
                              decimalDigits: 0,
                            ).format(160000),
                            style: mutedTextStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 13,
                          color: orangeColor,
                        ),
                        const SizedBox(width: 5),
                        Text('4.9',
                            style: darkTextStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                        Text(' (100 ulasan)',
                            style: darkTextStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 21),
          Text('Rating',
              style: darkTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400)),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 20,
                color: orangeColor,
              ),
              const SizedBox(width: 9),
              Icon(
                Icons.star,
                size: 20,
                color: orangeColor,
              ),
              const SizedBox(width: 9),
              Icon(
                Icons.star,
                size: 20,
                color: orangeColor,
              ),
              const SizedBox(width: 9),
              Icon(
                Icons.star,
                size: 20,
                color: orangeColor,
              ),
              const SizedBox(width: 9),
              Icon(
                Icons.star,
                size: 20,
                color: orangeColor,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('Review',
              style: darkTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400)),
          const SizedBox(height: 10),
          TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 11, horizontal: 19),
              fillColor: lightgreyColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: lightgreyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: lightgreyColor),
              ),
              hintText: 'Kopinya mantap',
              hintStyle: darkTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 24),
          Divider(color: greyColor, height: 1, thickness: 1),
          const SizedBox(height: 21),

          //2
          Row(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/product/default_product.png'),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Otten Coffee - Flores Manggarai Kopi Arabica',
                      overflow: TextOverflow.ellipsis,
                      style: darkTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 5),
                    Text.rich(
                      overflow: TextOverflow.ellipsis,
                      TextSpan(
                        //apply style to all
                        children: [
                          TextSpan(
                            text: NumberFormat.currency(
                              locale: "id_ID",
                              name: "IDR",
                              symbol: "Rp ",
                              decimalDigits: 0,
                            ).format(150000),
                            style: darkTextStyle.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 13,
                          color: orangeColor,
                        ),
                        const SizedBox(width: 5),
                        Text('4.9',
                            style: darkTextStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                        Text(' (100 ulasan)',
                            style: darkTextStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 21),
          Text('Rating',
              style: darkTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400)),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 20,
                color: orangeColor,
              ),
              const SizedBox(width: 9),
              Icon(
                Icons.star,
                size: 20,
                color: orangeColor,
              ),
              const SizedBox(width: 9),
              Icon(
                Icons.star,
                size: 20,
                color: orangeColor,
              ),
              const SizedBox(width: 9),
              Icon(
                Icons.star,
                size: 20,
                color: orangeColor,
              ),
              const SizedBox(width: 9),
              Icon(
                Icons.star,
                size: 20,
                color: orangeColor,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('Review',
              style: darkTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400)),
          const SizedBox(height: 10),
          TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 11, horizontal: 19),
              fillColor: lightgreyColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: lightgreyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: lightgreyColor),
              ),
              hintText: 'Mantap harga terjangkau',
              hintStyle: darkTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
