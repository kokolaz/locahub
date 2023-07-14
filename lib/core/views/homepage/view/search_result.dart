import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/views/homepage/controller/product_controller.dart';
import 'package:locahub/core/views/homepage/view/filter_page.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/skeleton_product.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/skeleton_toko.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/toko_list.dart';
import 'package:locahub/utils/search_card.dart';
import '../../global/theme.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key, required this.text});
  final String text;
  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  final TextEditingController searchController = TextEditingController();

  final productC = Get.put(ProductController());
  bool isLoading = true;
  bool isPrice = true;

  @override
  void initState() {
    productC.searchProduct(name: widget.text);
    //categoryC.fetchCategory();
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
                  controller: searchController,
                  textInputAction: TextInputAction.go,
                  onFieldSubmitted: (value) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return SearchResultPage(
                            text: searchController.text,
                          );
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
                    hintText: widget.text,
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
        productC.isLoading.value ? buildLoadingToko() : buildToko(),
        greyContainer(),
        productC.isLoading.value ? buildLoadingProduct() : productSearch(),
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
    return Obx(() => Container(
          margin: const EdgeInsets.only(bottom: 10, right: 24, left: 24),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: productC.listsearchResult.length >= 2
                    ? 2
                    : productC.listsearchResult.length,
                itemBuilder: (BuildContext context, int index) {
                  print(productC.listsearchResult.first);
                  return TokoList(
                      imageUrl: productC
                          .listsearchResult[index].galleries!.first.url!,
                      name: productC.listsearchResult[index].name!,
                      address: productC.listsearchResult[index].store!.addres!,
                      rating: double.parse(productC
                          .listsearchResult[index].rating!.first.rating
                          .toString()));
                },
              ),
            ],
          ),
        ));
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

  Widget productSearch() {
    return Container(
      margin: const EdgeInsets.only(top: 21),
      child: Obx(
        () {
          if (productC.listsearchResult.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.74,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: productC.listsearchResult.length,
              itemBuilder: (context, index) {
                final productDetail = productC.listsearchResult[index];
                final productGallery =
                    productC.listsearchResult[index].galleries!.first;
                return SearchProductCard(
                  gallery: productGallery,
                  product: productDetail,
                );
              },
            );
          }
        },
      ),
    );
  }

  // Widget buildProduct() {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 16, right: 24, left: 24),
  //     child: const Wrap(
  //       crossAxisAlignment: WrapCrossAlignment.center,
  //       spacing: 13,
  //       runSpacing: 13,
  //       children: [
  //         ProductCard(
  //             imageUrl: 'assets/images/product/floresmanggarai.png',
  //             name: 'Flores Manggarai 500g',
  //             price: 150000,
  //             rating: 4.9),
  //         ProductCard(
  //             imageUrl: 'assets/images/product/floresgourmet.png',
  //             name: 'Flores Gourmet Coffee',
  //             price: 35000,
  //             rating: 4.9),
  //         ProductCard(
  //             imageUrl: 'assets/images/product/floresbajawa.png',
  //             name: 'Flores Bajawa 200g Ko',
  //             price: 75000,
  //             rating: 5.0),
  //         ProductCard(
  //             imageUrl: 'assets/images/product/dripcoffee.png',
  //             name: 'Drip Coffee 10g Arabic',
  //             price: 50000,
  //             rating: 4.8),
  //         ProductCard(
  //             imageUrl: 'assets/images/product/kopirobusta.png',
  //             name: 'Kopi Robusta Watuag',
  //             price: 25000,
  //             rating: 4.5),
  //         ProductCard(
  //             imageUrl: 'assets/images/product/tehhijaudiet.png',
  //             name: 'Single Origin Arabica Fl',
  //             price: 80000),
  //       ],
  //     ),
  //   );
  // }
}
