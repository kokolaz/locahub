import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/product/view/detail_product.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int price;
  final double rating;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.name,
    this.price = 0,
    this.rating = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DetailProduct(),
          ),
        );
      },
      child: Card(
        elevation: 0,
        shadowColor: Colors.transparent,
        color: whiteColor,
        //color: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: (MediaQuery.of(context).size.width - 78) / 2,
          //padding: const EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //width: 152,
                height: 152,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(imageUrl), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 9),
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
                      ? Text(rating.toString(),
                          style: orangeTextStyle.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400))
                      : Expanded(
                          child: Text('Belum ada penilaian',
                              overflow: TextOverflow.ellipsis,
                              style: darkTextStyle.copyWith(
                                  fontSize: 11, fontWeight: FontWeight.w400)),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
