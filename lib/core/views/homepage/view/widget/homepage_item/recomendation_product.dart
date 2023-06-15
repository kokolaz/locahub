import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:locahub/core/models/product_model.dart';
import 'package:locahub/core/views/product/view/detail_product.dart';
import '../../../../global/theme.dart';
import 'package:get/get.dart';

class RecomendationProductCard extends StatelessWidget {
  final Products product;

  const RecomendationProductCard(this.product, {super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              //width: 152,
              //height: 152,
              //margin: const EdgeInsets.only(bottom: 9),
              decoration: BoxDecoration(
                color: orangeColor,
                borderRadius: BorderRadius.circular(20),
                image: (product.galleries!.isNotEmpty)
                    ? DecorationImage(
                        image: NetworkImage(product.galleries!.first.url!),
                        fit: BoxFit.cover,
                      )
                    : const DecorationImage(
                        image: AssetImage(
                          'assets/images/product/default_product.png',
                        ),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),

          //Text di bawah card gambar produk
          const SizedBox(height: 5),
          Text(
            product.name ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: darkTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 4),
          Text(
            NumberFormat.currency(
              locale: "id_ID",
              name: "IDR",
              symbol: "Rp ",
              decimalDigits: 0,
            ).format(double.parse(product.price ?? '0')),
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              product.rating!.isNotEmpty
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
              product.rating!.isNotEmpty
                  ? Text(product.rating!.first.rating.toString(),
                      style: orangeTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400))
                  : Expanded(
                      child: Text('Belum ada penilaian',
                          overflow: TextOverflow.ellipsis,
                          style: darkTextStyle.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400)),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
