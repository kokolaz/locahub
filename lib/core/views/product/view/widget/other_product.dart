import 'package:flutter/material.dart';
import 'package:locahub/core/models/product_model.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/product/view/detail_product.dart';
import 'package:intl/intl.dart';

class OtherProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final double rating;
  final Products? product;

  const OtherProductCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      this.price = 0,
      this.rating = 0,
      this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailProduct(
              product: product,
            ),
          ),
        );
      },
      child: Container(
        width: 137,
        height: 237,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 137,
              height: 137,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: darkTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                Text(
                  NumberFormat.currency(
                    locale: "id_ID",
                    name: "IDR",
                    symbol: "Rp ",
                    decimalDigits: 0,
                  ).format(price),
                  overflow: TextOverflow.ellipsis,
                  style: darkTextStyle.copyWith(
                      fontWeight: FontWeight.w700, fontSize: 14),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    rating > 0
                        ? Icon(
                            Icons.star,
                            size: 13,
                            color: orangeColor,
                          )
                        : Icon(
                            Icons.star,
                            size: 13,
                            color: darkgreyColor,
                          ),
                    const SizedBox(width: 5),
                    rating > 0
                        ? Text(
                            rating.toString(),
                            style: darkTextStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          )
                        : Expanded(
                            child: Text(
                              'Belum ada penilaian',
                              overflow: TextOverflow.ellipsis,
                              style: darkTextStyle.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
