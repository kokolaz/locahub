import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:get/get.dart';
import 'package:locahub/core/models/product_model.dart';
import 'package:locahub/core/views/homepage/controller/product_controller.dart';

class CustomerReviewCard extends StatefulWidget {
  final Products? product;

  const CustomerReviewCard(this.product, {super.key});

  @override
  State<CustomerReviewCard> createState() => _CustomerReviewCardState();
}

class _CustomerReviewCardState extends State<CustomerReviewCard> {
  final productC = Get.find<ProductController>();

  @override
  void initState() {
    super.initState();
    productC.fetchProductsStore(id: widget.product?.storeId);
    productC.fetchProductsId(id: widget.product?.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 23,
                  //backgroundColor: orangeColor.withOpacity(0.2),
                  backgroundImage:
                      AssetImage('assets/images/profile/user1.png'),
                ),
                const SizedBox(width: 11),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('name',
                        style: darkTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w700)),
                    Text('${widget.product?.rating![0].createdAt}',
                        overflow: TextOverflow.ellipsis,
                        style: darkTextStyle.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 12)),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 13,
                        color: orangeColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${widget.product?.rating![0].rating}',
                        style: darkTextStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          widget.product!.rating![0].url.toString().isNotEmpty
              ? SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 24),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: widget.product!.rating!
                          .map((item) => Container(
                              margin: const EdgeInsets.only(right: 15),
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    widget.product!.rating![0].url.toString(),
                                    height: 80,
                                  ))))
                          .toList()))
              : Container(),
          Padding(
            padding: const EdgeInsets.only(top: 14, left: 24, right: 24),
            child: Text(
              //textAlign: TextAlign.justify,
              '${widget.product?.rating![0].content}',
              style: darkTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
