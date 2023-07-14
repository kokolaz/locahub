import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/models/product_model.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/product/view/detail_product.dart';

class PopularProductCard extends StatelessWidget {
  final String name;
  final int terjual;
  final String imageUrl;
  final String keterangan;
  final Products product;

  const PopularProductCard(
      {super.key,
      required this.name,
      this.terjual = 0,
      required this.imageUrl,
      required this.keterangan,
      required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() {
          return DetailProduct(
            product: product,
          );
        });
      },
      child: Container(
        width: 137,
        height: 195,
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
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                ),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: orangeColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text(
                      keterangan,
                      style: whiteTextStyle.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: darkTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    style: mutedTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400), //apply style to all
                    children: [
                      TextSpan(
                        text: terjual.toString(),
                      ),
                      const TextSpan(
                        text: 'rb terjual',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
