import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/models/product_model.dart';
import 'package:locahub/core/views/homepage/controller/category_controller.dart';
import 'package:locahub/core/views/homepage/controller/product_controller.dart';

import 'package:locahub/core/views/homepage/view/widget/search_result/product_card.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/skeleton_product.dart';
import 'package:locahub/core/views/global/theme.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.initialIndex});
  final int initialIndex;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final categoryC = Get.put<CategoryController>;
  final ProductController productC = Get.put(ProductController());
  bool isLoading = true;
  bool isPrice = true;

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
    return DefaultTabController(
      initialIndex: widget.initialIndex,
      length: 7,
      child: Scaffold(
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
            "Kategori",
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
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 27),
            child: Container(
              margin: const EdgeInsets.only(right: 24, left: 24, bottom: 18),
              height: 27,
              child: TabBar(
                isScrollable: true,
                //indicatorColor: orangeColor,
                labelColor: orangeColor,
                unselectedLabelColor: darkColor,
                labelStyle: poppinsTextStyle.copyWith(
                    fontSize: 11.8, fontWeight: FontWeight.w700),
                unselectedLabelStyle: poppinsTextStyle.copyWith(
                    fontSize: 11.8, fontWeight: FontWeight.w400),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: orangeColor.withOpacity(0.2)),
                splashBorderRadius: BorderRadius.circular(15),
                tabs: const [
                  Tab(
                    text: 'Handycraft',
                  ),
                  Tab(
                    text: 'Makan & Minum',
                  ),
                  Tab(
                    text: 'Herbal',
                  ),
                  Tab(
                    text: 'Fashion',
                  ),
                  Tab(
                    text: 'Pertanian',
                  ),
                  Tab(
                    text: 'Kecantikan',
                  ),
                  Tab(
                    text: 'Kesehatan',
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            buildBody(category: "Handycraft"),
            buildBody(category: "Makan & Minum"),
            buildBody(category: "Herbal"),
            buildBody(category: "Fashion"),
            buildBody(category: "Pertanian"),
            buildBody(category: "Kecantikan"),
            buildBody(category: "Kesehatan"),
          ],
        ),
      ),
    );
  }

  Widget buildBody({String? category}) {
    return ListView(
      children: [
        greyContainer(),
        isLoading ? buildLoadingProduct() : buildProduct(category: category),
      ],
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

  Widget buildProduct({String? category}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, right: 24, left: 24),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13,
          mainAxisSpacing: 13,
          childAspectRatio: 1 / 1.5,
        ),
        itemCount: productC.products
            .where((products) =>
                products.category!.name ==
                category) // Replace 'categorySerupaName' with the desired category name
            .length,
        itemBuilder: (BuildContext context, int index) {
          final List<Products> categorySerupa = productC.products
              .where((products) =>
                  products.category!.name ==
                  category) // Replace 'categorySerupaName' with the desired category name
              .toList();

          if (index >= categorySerupa.length) {
            return const SizedBox();
          }

          final product = categorySerupa[index];

          return ProductCard(
            product: product,
            imageUrl: product.galleries!.first.url!,
            name: product.name!,
            price: int.parse(product.price.toString()),
            rating: double.parse(product.rating!.first.rating!),
          );
        },
      ),
    );
  }
}
