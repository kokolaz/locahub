import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/models/product_model.dart';
import 'package:locahub/core/views/homepage/controller/product_controller.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/skeleton_product.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/product/view/detail_product.dart';

class PopularProductDetail extends StatefulWidget {
  const PopularProductDetail({super.key});

  @override
  State<PopularProductDetail> createState() => _PopularProductDetailState();
}

class _PopularProductDetailState extends State<PopularProductDetail> {
  final ProductController productController = Get.put(ProductController());

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
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 13,
              mainAxisSpacing: 13,
              childAspectRatio: 1 / 1.4),
          itemCount: productController.products.length,
          itemBuilder: (BuildContext context, int index) {
            // Filter the list based on the "TERLARIS" tag
            final List<Products> terlarisProducts = productController.products
                .where((product) => product.tags!.contains("Terlaris"))
                .toList();

            // Check if the current index is within the filtered list's bounds
            if (index >= terlarisProducts.length) {
              return const SizedBox(); // Return an empty widget if the index is out of bounds
            }

            // Access the filtered product at the current index
            final product = terlarisProducts[index];

            return PopularProductDetailCard(
              product: product,
              name: product.name!,
              terjual: 84,
              imageUrl: product.galleries!.first.url!,
              keterangan: 'TOP',
            );
          },
        ));
  }
}

class PopularProductDetailCard extends StatelessWidget {
  final String name;
  final int terjual;
  final String imageUrl;
  final String keterangan;
  final Products product;

  const PopularProductDetailCard(
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
                      image: NetworkImage(imageUrl), fit: BoxFit.cover),
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
