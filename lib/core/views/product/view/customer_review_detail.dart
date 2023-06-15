import 'package:flutter/material.dart';
import 'package:locahub/core/views/homepage/view/widget/filter_page/rating_filter.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/product/view/widget/customer_review.dart';
import 'package:locahub/core/views/product/view/widget/variant.dart';
import '../../../models/product_model.dart';

class CustomerReviewDetail extends StatefulWidget {
  final Products? product;
  const CustomerReviewDetail({Key? key, this.product}) : super(key: key);

  @override
  State<CustomerReviewDetail> createState() => _CustomerReviewDetailState();
}

class _CustomerReviewDetailState extends State<CustomerReviewDetail> {
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
            "Penilaian Pembeli",
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
            filter(),
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

  Widget filter() {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 25),
      child: Wrap(
        children: const [
          VariantCard(id: 1, name: 'Semua'),
          VariantCard(id: 2, name: 'Tanpa Foto'),
          VariantCard(id: 3, name: 'Dengan Foto'),
          RatingProduct(id: 1, rating: 5),
          RatingProduct(id: 2, rating: 4),
          RatingProduct(id: 3, rating: 3),
          RatingProduct(id: 4, rating: 2),
          RatingProduct(id: 5, rating: 1)
        ],
      ),
    );
  }

  Widget content() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.product!.rating!.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              greyContainer(),
              CustomerReviewCard(widget.product),
            ],
          ),
        );
      },
    );
  }
}
