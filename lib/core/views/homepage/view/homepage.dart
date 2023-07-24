import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:locahub/core/models/product_model.dart' as model;
import 'package:locahub/core/views/homepage/controller/main_controller.dart';
import 'package:locahub/core/views/homepage/view/widget/homepage_item/category/categories/beauty.dart';
import 'package:locahub/core/views/homepage/view/widget/homepage_item/category/categories/fashion.dart';
import 'package:locahub/core/views/homepage/view/widget/homepage_item/category/categories/food_beverage.dart';
import 'package:locahub/core/views/homepage/view/widget/homepage_item/category/categories/handycraft.dart';
import 'package:locahub/core/views/homepage/view/widget/homepage_item/category/categories/health.dart';
import 'package:locahub/core/views/homepage/view/widget/homepage_item/category/categories/herbs.dart';
import 'package:locahub/core/views/homepage/controller/product_controller.dart';
import 'package:locahub/core/views/homepage/view/search_page.dart';
import 'package:locahub/core/views/homepage/view/widget/homepage_item/category/categories/agriculture.dart';
import 'package:locahub/core/views/homepage/view/widget/homepage_item/category/category.dart';
import 'package:locahub/core/views/homepage/view/widget/homepage_item/category/category_card.dart';
import 'package:locahub/core/views/homepage/view/widget/homepage_item/popular_product/popular_product.dart';
import 'package:locahub/core/views/homepage/view/widget/homepage_item/popular_product/popular_product_card.dart';
import 'package:locahub/core/views/homepage/view/widget/homepage_item/recomendation_product.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../notification/view/notification.dart';
import '../../global/theme.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductController productController = Get.put(ProductController());
  final mainC = Get.find<MainController>();
  //final categoryC = Get.put(CategoryController());

  @override
  void initState() {
    productController.fetchProducts();
    //categoryC.fetchCategory();
    super.initState();
  }

  //Fungsi banner
  int activeIndex = 0;
  final List<String> imageList = [
    "assets/images/banner/banner.png",
    "assets/images/banner/banner1.png",
    "assets/images/banner/banner2.png",
    "assets/images/banner/banner3.png"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      home: Scaffold(
        backgroundColor: whiteColor,
        body: ListView(children: <Widget>[
          Stack(children: [
            SizedBox(
              width: Get.width,
              child: Image.asset(
                'assets/images/hiasan.png',
                fit: BoxFit.contain,
              ),
            ),
            Column(
              children: [
                header(),
                searchBar(),
                bannerFunction(),
                categoryProduct(),
                popularProduct(),
                recomendationProduct(),
              ],
            ),
          ]),
        ]),
      ),
    );
  }

//Fungsi-fungsi

  //Fungsi profil dan notifikasi
  Widget header() {
    return Container(
      padding: const EdgeInsets.only(bottom: 21, top: 24, left: 24, right: 24),
      child: Row(
        children: [
          CircleAvatar(
            maxRadius: 25,
            backgroundColor: orangeColor.withOpacity(0.2),
            child: Image.asset(
              'assets/icon/person.png',
              alignment: Alignment.bottomCenter,
              height: 46,
              width: 40,
            ),
          ),
          const SizedBox(width: 11),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  overflow: TextOverflow.ellipsis,
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'Hi, ',
                          style: darkTextStyle.copyWith(
                              fontWeight: FontWeight.w400)),
                      TextSpan(
                          text: mainC.users.value.name ?? '',
                          //text: userController.users.first.name ?? 'user',
                          style: darkTextStyle.copyWith(
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                ),
                Text("@${mainC.users.value.username ?? ''}",
                    overflow: TextOverflow.ellipsis,
                    style: mutedTextStyle.copyWith(
                        fontWeight: FontWeight.w400, fontSize: 12)),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 0),
            alignment: Alignment.topRight,
            splashRadius: 25,
            icon: Icon(
              Icons.notifications,
              color: darkColor,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return const NotificationPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  //Fungsi search bar
  Widget searchBar() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return const SearchPage();
            },
          ),
        );
      },
      child: Container(
        height: 43,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(bottom: 28, left: 24, right: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: blackColor.withOpacity(0.05),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cari apa saja',
              style: mutedTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
            Icon(
              Icons.search,
              color: textmutedColor,
            )
          ],
        ),
      ),
    );
  }

  //Fungsi indicator banner
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: imageList.length,
        effect: ExpandingDotsEffect(
            dotHeight: 7,
            dotWidth: 7,
            activeDotColor: orangeColor,
            dotColor: whiteColor),
      );

  //Fungsi Banner
  Widget bannerFunction() {
    return Container(
      padding: const EdgeInsets.only(bottom: 21, left: 24, right: 24),
      child: Stack(children: <Widget>[
        //Banner slider
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            aspectRatio: 32 / 12,
            autoPlay: true,
            autoPlayCurve: Curves.linear,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
          items: imageList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    i,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
        //Indicator
        Positioned.fill(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: buildIndicator(),
                ))),
      ]),
    );
  }

  //Fungsi kategori
  Widget categoryProduct() {
    //final categoryC = Get.put(CategoryController());
    return Container(
      padding: const EdgeInsets.only(bottom: 35),
      child: Column(
        children: [
          //Title
          Container(
            padding: const EdgeInsets.only(right: 24, left: 24, bottom: 21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Kategori',
                    style: darkTextStyle.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 16)),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Category(),
                        ),
                      );
                    },
                    child: Text('Selengkapnya >>',
                        style: orangeTextStyle.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 10))),
              ],
            ),
          ),
          //Card
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  //SizedBox(width: 24),
                  CategoryCard(
                    iconUrl: 'assets/icon/handycraft.png',
                    name: 'Handycraft',
                    onTap: () {
                      Get.to(() {
                        return const HandyCraft();
                      });
                    },
                  ),
                  CategoryCard(
                    iconUrl: 'assets/icon/makan&minum.png',
                    name: 'Makan & Minum',
                    onTap: () {
                      Get.to(() {
                        return const FoodBeverage();
                      });
                    },
                  ),
                  CategoryCard(
                    iconUrl: 'assets/icon/herbal.png',
                    name: 'Herbal',
                    onTap: () {
                      Get.to(() {
                        return const Herbs();
                      });
                    },
                  ),
                  CategoryCard(
                    iconUrl: 'assets/icon/fashion.png',
                    name: 'Fashion',
                    onTap: () {
                      Get.to(() {
                        return const Fashion();
                      });
                    },
                  ),
                  CategoryCard(
                    iconUrl: 'assets/icon/pertanian.png',
                    name: 'Pertanian',
                    onTap: () {
                      Get.to(() {
                        return const Agriculture();
                      });
                    },
                  ),
                  CategoryCard(
                    iconUrl: 'assets/icon/kecantikan.png',
                    name: 'Kecantikan',
                    onTap: () {
                      Get.to(() {
                        return const Beauty();
                      });
                    },
                  ),
                  CategoryCard(
                    iconUrl: 'assets/icon/kesehatan.png',
                    name: 'Kesehatan',
                    onTap: () {
                      Get.to(() {
                        return const Health();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          //Integrasi card category
          // Container(
          //     height: 140,
          //     margin: const EdgeInsets.only(top: 21),
          //     child: categoryC.isLoading.value
          //         ? const SizedBox()
          //         : ListView.builder(
          //             scrollDirection: Axis.horizontal,
          //             shrinkWrap: true,
          //             itemCount: categoryC.category.length,
          //             itemBuilder: (ctx, index) {
          //               Kategori item = categoryC.category[index];
          //               return CategoryCard(
          //                 iconUrl: 'assets/icon/handycraft.png',
          //                 name: item.name ?? '',
          //                 onTap: () {
          //                   Get.to(() {
          //                     return Category(
          //                       id: item.id.toString(),
          //                     );
          //                   });
          //                 },
          //               );
          //             })),
        ],
      ),
    );
  }

  //Fungsi produk terlaris
  Widget popularProduct() {
    return Container(
      padding: const EdgeInsets.only(bottom: 35),
      child: Stack(children: [
        SizedBox(
          width: Get.width,
          child: Image.asset(
            'assets/images/hiasan_terbalik.png',
            fit: BoxFit.contain,
          ),
        ),
        Column(
          children: [
            //Title
            Container(
              padding: const EdgeInsets.only(
                  right: 24, left: 24, bottom: 21, top: 28),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Produk Terlaris',
                          style: darkTextStyle.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 16)),
                      GestureDetector(
                        onTap: () {
                          Get.to(() {
                            return const PopularProductDetail();
                          });
                        },
                        child: Text('Selengkapnya >>',
                            style: orangeTextStyle.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 10)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Card
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.only(left: 24),
                child: Row(
                  children: const [
                    PopularProductCard(
                      name: 'Madu Lebah',
                      terjual: 84,
                      imageUrl: 'assets/images/product/madulebah.png',
                      keterangan: 'TOP',
                    ),
                    PopularProductCard(
                      name: 'Teh Herbal',
                      terjual: 51,
                      imageUrl: 'assets/images/product/tehherbal.png',
                      keterangan: 'TOP',
                    ),
                    PopularProductCard(
                      name: 'Pupuk Kandang',
                      terjual: 43,
                      imageUrl: 'assets/images/product/pupukkandang.png',
                      keterangan: 'TOP',
                    ),
                    PopularProductCard(
                      name: 'Jamu Herbal',
                      terjual: 84,
                      imageUrl: 'assets/images/product/jamuherbal.png',
                      keterangan: 'TOP',
                    ),
                    PopularProductCard(
                      name: 'Biji Kopi Arabica',
                      terjual: 51,
                      imageUrl: 'assets/images/product/bijikopiarabica.png',
                      keterangan: 'TOP',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget recomendationProduct() {
    return Container(
      padding: const EdgeInsets.only(bottom: 35),
      child: Stack(children: [
        SizedBox(
            width: Get.width,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Image.asset(
                'assets/images/hiasan_terbalik.png',
                fit: BoxFit.contain,
              ),
            )),
        Container(
          padding:
              const EdgeInsets.only(right: 24, left: 24, bottom: 21, top: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text('Rekomendasi Produk',
                  style: darkTextStyle.copyWith(
                      fontWeight: FontWeight.w700, fontSize: 16)),
              //Card
              Container(
                margin: const EdgeInsets.only(top: 21),
                child: Obx(
                  () {
                    if (productController.products.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final sortedProducts = _getSortedProductsByRatingLength(
                          productController.products, 0);
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        primary: false,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.74,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: sortedProducts.length,
                        itemBuilder: (context, index) {
                          final product = sortedProducts[index];
                          return RecomendationProductCard(product);
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  List<model.Products> _getSortedProductsByRatingLength(
      List<model.Products> products, int index) {
    var sortedProduct = products.where((e) => e.rating!.isNotEmpty).toList();
    sortedProduct.sort((a, b) => double.parse(b.rating![index].rating!)
        .compareTo(double.parse(a.rating![index].rating!)));
    return sortedProduct.where((p) {
      final rating = double.parse(p.rating![index].rating!);
      return rating >= 4.8 && rating <= 5;
    }).toList();
  }
}
