import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/product_card.dart';
import 'package:locahub/core/views/homepage/view/search_page.dart';
import 'package:locahub/core/views/product/view/widget/other_product.dart';
import 'package:locahub/core/views/store/view/store_information.dart';
import '../../global/theme.dart';

class StorePage extends StatefulWidget {
  final int initialIndex;

  const StorePage({super.key, required this.initialIndex});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  SliverAppBar showSliverAppBar() {
    return SliverAppBar(
      toolbarHeight: 258,
      backgroundColor: whiteColor,
      elevation: 0.0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      floating: true,
      pinned: true,
      snap: false,
      title: Column(
        children: [
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
                        return const SearchPage();
                      },
                    ),
                  );
                },
              )
            ],
          ),

          //storename
          Container(
            margin:
                const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 24),
            child: Column(
              children: [
                Image.asset('assets/images/store/kioskopifloratama.png'),
                const SizedBox(height: 15),
                Text(
                  "Kios Kopi Floratama",
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
                      'Kab. Flores Timur, Nusa Tenggara Timur',
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
                      '23 produk',
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
        ],
      ),
      bottom: TabBar(
        indicatorColor: orangeColor,
        labelColor: orangeColor,
        unselectedLabelColor: darkColor,
        labelStyle:
            orangeTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
        unselectedLabelStyle:
            darkTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: DefaultTabController(
          initialIndex: widget.initialIndex,
          length: 3,
          child: TabBarView(children: [
            //buildStore
            CustomScrollView(
              slivers: [
                showSliverAppBar(),
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
                showSliverAppBar(),
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
                showSliverAppBar(),
                SliverList(
                  delegate: SliverChildListDelegate([
                    categoryFunc(),
                  ]),
                ),
              ],
            ),
          ]),
        ));
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
                    return const StorePage(initialIndex: 1);
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              children: const [
                OtherProductCard(
                  imageUrl: 'assets/images/product/kopirobustabali.png',
                  name: 'Kopi Robusta Bali',
                  price: 20000,
                  rating: 4.9,
                ),
                OtherProductCard(
                  imageUrl: 'assets/images/product/arutalakopitoraja.png',
                  name: 'Arutala Kopi Toraja',
                  price: 29999,
                  rating: 4.9,
                ),
                OtherProductCard(
                  imageUrl: 'assets/images/product/kopirobustasumatera.png',
                  name: 'Kopi Robusta Sumatera',
                  price: 20900,
                  rating: 4.9,
                ),
                OtherProductCard(
                  imageUrl: 'assets/images/product/kopirobustajava.png',
                  name: 'Kopi Robusta Java',
                  price: 58000,
                  rating: 4.8,
                ),
                OtherProductCard(
                  imageUrl: 'assets/images/product/kopirobusta.png',
                  name: 'Kopi Robusta Watu',
                  price: 25000,
                  rating: 4.5,
                ),
                OtherProductCard(
                  imageUrl: 'assets/images/product/kopibarasignature.png',
                  name: 'Kopi Bara Signature',
                  price: 72000,
                  rating: 0,
                ),
              ],
            ),
          ),
        ),
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
                    return const StorePage(initialIndex: 1);
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
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 13,
            runSpacing: 13,
            children: const [
              ProductCard(
                  imageUrl: 'assets/images/product/floresmanggarai.png',
                  name: 'Flores Manggarai 500g',
                  price: 150000,
                  rating: 4.9),
              ProductCard(
                  imageUrl: 'assets/images/product/floresgourmet.png',
                  name: 'Flores Gourmet Coffee',
                  price: 35000,
                  rating: 4.9),
              ProductCard(
                  imageUrl: 'assets/images/product/floresbajawa.png',
                  name: 'Flores Bajawa 200g Ko',
                  price: 75000,
                  rating: 5.0),
              ProductCard(
                  imageUrl: 'assets/images/product/dripcoffee.png',
                  name: 'Drip Coffee 10g Arabic',
                  price: 50000,
                  rating: 4.8),
              ProductCard(
                  imageUrl: 'assets/images/product/kopirobusta.png',
                  name: 'Kopi Robusta Watuag',
                  price: 25000,
                  rating: 4.5),
              ProductCard(
                  imageUrl: 'assets/images/product/tehhijaudiet.png',
                  name: 'Single Origin Arabica Fl',
                  price: 80000),
            ],
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
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 13,
            runSpacing: 13,
            children: const [
              ProductCard(
                  imageUrl: 'assets/images/product/floresmanggarai.png',
                  name: 'Flores Manggarai 500g',
                  price: 150000,
                  rating: 4.9),
              ProductCard(
                  imageUrl: 'assets/images/product/floresgourmet.png',
                  name: 'Flores Gourmet Coffee',
                  price: 35000,
                  rating: 4.9),
              ProductCard(
                  imageUrl: 'assets/images/product/floresbajawa.png',
                  name: 'Flores Bajawa 200g Ko',
                  price: 75000,
                  rating: 5.0),
              ProductCard(
                  imageUrl: 'assets/images/product/dripcoffee.png',
                  name: 'Drip Coffee 10g Arabic',
                  price: 50000,
                  rating: 4.8),
              ProductCard(
                  imageUrl: 'assets/images/product/kopirobusta.png',
                  name: 'Kopi Robusta Watuag',
                  price: 25000,
                  rating: 4.5),
              ProductCard(
                  imageUrl: 'assets/images/product/tehhijaudiet.png',
                  name: 'Single Origin Arabica Fl',
                  price: 80000),
            ],
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