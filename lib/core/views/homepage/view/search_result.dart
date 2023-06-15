import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/views/homepage/controller/product_controller.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/product_card.dart';
import 'package:locahub/core/views/homepage/view/filter_page.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/skeleton_product.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/skeleton_toko.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/toko_list.dart';
import '../../global/theme.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  final productC = Get.find<ProductController>();
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

  // void initState() {
  //   productC.productScrollController.addListener(() {
  //     //position: " + productC.productScrollController.position.pixels.toString());
  //     //max: " + productC.productScrollController.position.maxScrollExtent.toString());

  //     if (productC.productScrollController.position.pixels ==
  //         productC.productScrollController.position.maxScrollExtent) {
  //       productC.pageProduct.value++;
  //       productC.fetchProducts();
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          //normalnya 56
          toolbarHeight: 160,
          backgroundColor: Colors.transparent,
          //bottomOpacity: 0.0,
          elevation: 0.0,
          centerTitle: true,
          automaticallyImplyLeading: false,
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
                  Text(
                    "Hasil Pencarian",
                    style: darkTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  IconButton(
                    padding: const EdgeInsets.only(right: 12),
                    alignment: Alignment.centerRight,
                    icon: Icon(
                      Icons.filter_alt,
                      color: darkgreyColor,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return const FilterPage();
                          },
                        ),
                      );
                    },
                  )
                ],
              ),

              //searchbar
              Container(
                height: 43,
                //margin harusnya ada bottom 20
                margin: const EdgeInsets.only(top: 17),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  textInputAction: TextInputAction.go,
                  onFieldSubmitted: (value) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return const SearchResultPage();
                        },
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    fillColor: blackColor.withOpacity(0.05),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: blackColor.withOpacity(0.05)),
                    ),
                    contentPadding: const EdgeInsets.only(top: 16, left: 16),
                    hintText: 'Kopi Flores',
                    hintStyle: darkTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Icon(
                        Icons.search,
                        color: textmutedColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 27),
            child: Container(
              margin: const EdgeInsets.only(right: 24, left: 24, bottom: 18),
              height: 27,
              child: TabBar(
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
                tabs: [
                  const Tab(
                    text: 'Terkait',
                  ),
                  const Tab(
                    text: 'Terbaru',
                  ),
                  const Tab(
                    text: 'Terlaris',
                  ),
                  Tab(
                    child: GestureDetector(
                      onDoubleTap: () {
                        setState(() {
                          isPrice = !isPrice;
                        });
                      },
                      child: Row(
                        children: [
                          const Text(
                            'Harga',
                          ),
                          Expanded(
                              child: Icon(isPrice
                                  ? Icons.arrow_drop_down
                                  : Icons.arrow_drop_up)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            buildBody(),
            buildBody(),
            buildBody(),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return ListView(
      children: [
        greyContainer(),
        isLoading ? buildLoadingToko() : buildToko(),
        greyContainer(),
        isLoading ? buildLoadingProduct() : buildProduct(),
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

  Widget buildLoadingToko() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, right: 24, left: 24),
      child: Column(
        children: const [
          SkeletonToko(),
          SkeletonToko(),
        ],
      ),
    );
  }

  Widget buildToko() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, right: 24, left: 24),
      child: Column(
        children: const [
          TokoList(
              imageUrl: 'assets/images/store/kioskopifloratama.png',
              name: 'Kios Kopi Floratama',
              address: 'Kab. Flores Timur, Nusa Tenggara Timur',
              rating: 4.9),
          TokoList(
              imageUrl: 'assets/images/product/djamoewayang.png',
              name: 'Djamoe Wayang',
              address: 'Kab. Malang, Jawa Timur',
              rating: 4.8),
        ],
      ),
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
    );
  }
}
