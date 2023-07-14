import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/models/product_model.dart';
import 'package:locahub/core/views/homepage/controller/product_controller.dart';
import 'package:locahub/core/views/homepage/controller/store_controller.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/product_card.dart';
import 'package:locahub/core/views/homepage/view/search_page.dart';
import 'package:locahub/core/views/product/view/widget/other_product.dart';
import 'package:locahub/core/views/store/view/store_information.dart';
import '../../global/theme.dart';

class StorePage extends StatefulWidget {
  final int initialIndex;
  final String name;

  const StorePage({super.key, required this.initialIndex, required this.name});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  // final storeC = Get.find<StoreController>();
  final storeC = Get.put<StoreController>(StoreController());
  final productC = Get.find<ProductController>();

  @override
  void initState() {
    super.initState();
    storeC.fetchStore(name: widget.name);
    productC.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          child: DefaultTabController(
            initialIndex: widget.initialIndex,
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder: (context, _) {
                return [
                  SliverList(
                    delegate:
                        SliverChildListDelegate([showSliverAppBar(context)]),
                  ),
                ];
              },
              body: Column(
                children: [
                  TabBar(
                    indicatorColor: orangeColor,
                    labelColor: orangeColor,
                    unselectedLabelColor: darkColor,
                    labelStyle: orangeTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w700),
                    unselectedLabelStyle: darkTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                      Tab(
                        text: 'Toko',
                      ),
                      Tab(
                        text: 'Produk',
                      ),
                      Tab(
                        text: 'Kategori',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      //buildStore
                      CustomScrollView(
                        slivers: [
                          SliverList(
                            delegate: SliverChildListDelegate([
                              storeInformation(),
                              popularProduct(),
                              recomendationProduct(),
                            ]),
                          ),
                        ],
                      ),
                      //buildProduct
                      CustomScrollView(
                        slivers: [
                          // showSliverAppBar(),
                          SliverList(
                            delegate: SliverChildListDelegate([
                              storeProduct(),
                            ]),
                          ),
                        ],
                      ),
                      //buildCategory
                      CustomScrollView(
                        slivers: [
                          // showSliverAppBar(),
                          SliverList(
                            delegate: SliverChildListDelegate([
                              categoryFunc(),
                            ]),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Column showSliverAppBar(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: const EdgeInsets.only(left: 12),
            alignment: Alignment.centerLeft,
            icon: Icon(
              Icons.arrow_back_ios,
              color: darkgreyColor,
              size: 14,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 12),
            alignment: Alignment.centerRight,
            icon: Icon(
              Icons.search,
              color: darkgreyColor,
              size: 20,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return SearchPage();
                  },
                ),
              );
            },
          )
        ],
      ),

      //storename
      Container(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 24),
        child: Column(
          children: [
            Image.asset('assets/images/store/kioskopifloratama.png'),
            const SizedBox(height: 15),
            Text(
              widget.name,
              style: darkTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  size: 13,
                  color: textmutedColor,
                ),
                const SizedBox(width: 5),
                Text(
                  storeC.listStore.first.city,
                  style: mutedTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  size: 13,
                  color: orangeColor,
                ),
                const SizedBox(width: 5),
                Text(
                  '5.0',
                  style: darkTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 15),
                Image.asset('assets/images/store/storeproduct.png'),
                const SizedBox(width: 5),
                Text(
                  '${storeC.listStore.first.products.length} produk',
                  style: darkTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 15),
                Image.asset('assets/images/store/sold.png'),
                const SizedBox(width: 5),
                Text(
                  '145 terjual',
                  style: darkTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }

  Widget storeInformation() {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Informasi Toko',
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() {
                    return const StoreInformationDetail();
                  });
                },
                child: Text(
                  'Selengkapnya >>',
                  style: orangeTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'Kios Kopi Floratama merupakan toko kopi yang paling lengkap di NTT dengan berbagai varian dan jenis kopi dari seluruh daerah di Indonesia.',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget popularProduct() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Produk Terlaris',
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() {
                    return StorePage(
                      initialIndex: 1,
                      name: widget.name,
                    );
                  });
                },
                child: Text(
                  'Selengkapnya >>',
                  style: orangeTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 220,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 24),
            itemCount: productC.products
                        .where(
                            (products) => products.store!.name == widget.name)
                        .length >
                    5
                ? 5
                : productC.products
                    .where((products) => products.store!.name == widget.name)
                    .length,
            itemBuilder: (BuildContext context, int index) {
              final List<Products> categorySerupa = productC.products
                  .where((products) =>
                      products.store!.name ==
                      widget
                          .name) // Replace 'categorySerupaName' with the desired category name
                  .toList();

              if (index >= categorySerupa.length) {
                return const SizedBox();
              }

              final product = categorySerupa[index];
              return OtherProductCard(
                product: product,
                imageUrl: product.galleries!.first.url!,
                name: product.name!,
                price: double.parse(product.price!),
                rating: double.parse(product.rating!.first.rating!),
              );
            },
          ),
        )
      ],
    );
  }

  Widget recomendationProduct() {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mungkin Kamu Suka',
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() {
                    return StorePage(
                      initialIndex: 1,
                      name: widget.name,
                    );
                  });
                },
                child: Text(
                  'Selengkapnya >>',
                  style: orangeTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          GridView.builder(
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
                    products.store!.name ==
                    widget
                        .name) // Replace 'categorySerupaName' with the desired category name
                .length,
            itemBuilder: (BuildContext context, int index) {
              final List<Products> categorySerupa = productC.products
                  .where((products) =>
                      products.store!.name ==
                      widget
                          .name) // Replace 'categorySerupaName' with the desired category name
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
        ],
      ),
    );
  }

  Widget storeProduct() {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 24),
      child: Column(
        children: [
          GridView.builder(
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
                    products.store!.name ==
                    widget
                        .name) // Replace 'categorySerupaName' with the desired category name
                .length,
            itemBuilder: (BuildContext context, int index) {
              final List<Products> categorySerupa = productC.products
                  .where((products) =>
                      products.store!.name ==
                      widget
                          .name) // Replace 'categorySerupaName' with the desired category name
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
        ],
      ),
    );
  }

  Widget categoryFunc() {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 24),
      child: Column(
        children: const [
          CategoryCard(categoryName: 'Semua Produk'),
          CategoryCard(categoryName: 'Biji Kopi'),
          CategoryCard(categoryName: 'Biji Kopi Roasting'),
          CategoryCard(categoryName: 'Bubuk Kopi Kemasan Curah'),
          CategoryCard(categoryName: 'Bubuk Kopi Sachet'),
          CategoryCard(categoryName: 'Alat Kopi'),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;

  const CategoryCard({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  categoryName,
                  overflow: TextOverflow.ellipsis,
                  style: darkTextStyle.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: darkgreyColor,
                size: 14,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 13),
            height: 1,
            color: greyColor,
          ),
        ],
      ),
    );
  }
}


//