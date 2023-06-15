import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/skeleton_product.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/product/view/detail_product.dart';

class PopularProductDetail extends StatefulWidget {
  const PopularProductDetail({super.key});

  @override
  State<PopularProductDetail> createState() => _PopularProductDetailState();
}

class _PopularProductDetailState extends State<PopularProductDetail> {
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        //normalnya 56
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        //bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Produk Terlaris",
          style:
              darkTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
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
          isLoading ? buildLoadingProduct() : buildProduct(),
        ],
      ),
    );
  }

  Widget greyContainer() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 9,
      color: lightgreyColor,
    );
  }

  Widget buildLoadingProduct() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, right: 24, left: 24),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 13,
        runSpacing: 13,
        children: const [
          SkeletonProduct(),
          SkeletonProduct(),
          SkeletonProduct(),
          SkeletonProduct(),
          SkeletonProduct(),
          SkeletonProduct(),
        ],
      ),
    );
  }

  Widget buildProduct() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, right: 24, left: 24),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 13,
        runSpacing: 13,
        children: const [
          PopularProductDetailCard(
            name: 'Madu Lebah',
            terjual: 84,
            imageUrl: 'assets/images/product/madulebah.png',
            keterangan: 'TOP',
          ),
          PopularProductDetailCard(
            name: 'Teh Herbal',
            terjual: 51,
            imageUrl: 'assets/images/product/tehherbal.png',
            keterangan: 'TOP',
          ),
          PopularProductDetailCard(
            name: 'Pupuk Kandang',
            terjual: 43,
            imageUrl: 'assets/images/product/pupukkandang.png',
            keterangan: 'TOP',
          ),
          PopularProductDetailCard(
            name: 'Jamu Herbal',
            terjual: 84,
            imageUrl: 'assets/images/product/jamuherbal.png',
            keterangan: 'TOP',
          ),
          PopularProductDetailCard(
            name: 'Biji Kopi Arabica',
            terjual: 51,
            imageUrl: 'assets/images/product/bijikopiarabica.png',
            keterangan: 'TOP',
          ),
        ],
      ),
    );
  }
}

class PopularProductDetailCard extends StatelessWidget {
  final String name;
  final int terjual;
  final String imageUrl;
  final String keterangan;

  const PopularProductDetailCard(
      {super.key,
      required this.name,
      this.terjual = 0,
      required this.imageUrl,
      required this.keterangan});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() {
          return const DetailProduct();
        });
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // width: 152,
                height: 152,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(imageUrl), fit: BoxFit.cover),
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
              const SizedBox(height: 14),
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
      ),
    );
  }
}
