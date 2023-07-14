// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:locahub/core/views/homepage/controller/category_controller.dart';
// import 'package:locahub/core/views/homepage/view/widget/search_result/product_card.dart';
// import 'package:locahub/core/views/homepage/view/widget/search_result/skeleton_product.dart';
// import 'package:locahub/core/views/global/theme.dart';

// class Category extends StatefulWidget {
//   final String? id;
//   const Category({super.key, this.id});

//   @override
//   State<Category> createState() => _CategoryState();
// }

// class _CategoryState extends State<Category> {
//   bool isLoading = true;
//   bool isPrice = true;
//   final categoryC = Get.put<CategoryController>;

//   @override
//   void initState() {
//     Future.delayed(const Duration(seconds: 2), () {
//       setState(() {
//         isLoading = false;
//       });
//     });

//     //categoryC.fetchProductsCategory(id: widget.id);

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 7,
//       child: Scaffold(
//         backgroundColor: whiteColor,
//         appBar: AppBar(
//           //normalnya 56
//           toolbarHeight: 100,
//           backgroundColor: Colors.transparent,
//           //bottomOpacity: 0.0,
//           elevation: 0.0,
//           centerTitle: true,
//           automaticallyImplyLeading: false,
//           title: Text(
//             "Kategori",
//             style: darkTextStyle.copyWith(
//                 fontSize: 16, fontWeight: FontWeight.w400),
//           ),
//           leading: IconButton(
//             //harusnya gapake padding
//             padding: const EdgeInsets.only(left: 12),
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: darkgreyColor,
//               size: 14,
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           bottom: PreferredSize(
//             preferredSize: const Size(double.infinity, 27),
//             child: Container(
//               margin: const EdgeInsets.only(right: 24, left: 24, bottom: 18),
//               height: 27,
//               child: TabBar(
//                 isScrollable: true,
//                 //indicatorColor: orangeColor,
//                 labelColor: orangeColor,
//                 unselectedLabelColor: darkColor,
//                 labelStyle: poppinsTextStyle.copyWith(
//                     fontSize: 11.8, fontWeight: FontWeight.w700),
//                 unselectedLabelStyle: poppinsTextStyle.copyWith(
//                     fontSize: 11.8, fontWeight: FontWeight.w400),
//                 indicatorSize: TabBarIndicatorSize.tab,
//                 indicator: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: orangeColor.withOpacity(0.2)),
//                 splashBorderRadius: BorderRadius.circular(15),
//                 tabs: const [
//                   Tab(
//                     text: 'Handycraft',
//                   ),
//                   Tab(
//                     text: 'Makan & Minum',
//                   ),
//                   Tab(
//                     text: 'Herbal',
//                   ),
//                   Tab(
//                     text: 'Fashion',
//                   ),
//                   Tab(
//                     text: 'Pertanian',
//                   ),
//                   Tab(
//                     text: 'Kecantikan',
//                   ),
//                   Tab(
//                     text: 'Kesehatan',
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             buildBody(),
//             buildBody(),
//             buildBody(),
//             buildBody(),
//             buildBody(),
//             buildBody(),
//             buildBody(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildBody() {
//     return ListView(
//       children: [
//         greyContainer(),
//         isLoading ? buildLoadingProduct() : buildProduct(),
//       ],
//       // return Obx(
//       //   () => ListView(
//       //     children: [
//       //       greyContainer(),
//       //       categoryC.isProductCategory.value
//       //           ? buildLoadingProduct()
//       //           : buildProduct(),
//       //     ],
//       //   ),
//     );
//   }

//   Widget greyContainer() {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       height: 9,
//       color: lightgreyColor,
//     );
//   }

//   Widget buildLoadingProduct() {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16, right: 24, left: 24),
//       child: Wrap(
//         crossAxisAlignment: WrapCrossAlignment.center,
//         spacing: 13,
//         runSpacing: 13,
//         children: const [
//           SkeletonProduct(),
//           SkeletonProduct(),
//           SkeletonProduct(),
//           SkeletonProduct(),
//           SkeletonProduct(),
//           SkeletonProduct(),
//         ],
//       ),
//     );
//   }

//   Widget buildProduct() {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16, right: 24, left: 24),
//       child: Wrap(
//         crossAxisAlignment: WrapCrossAlignment.center,
//         spacing: 13,
//         runSpacing: 13,
//         children: const [
//           ProductCard(
//               imageUrl: 'assets/images/product/floresmanggarai.png',
//               name: 'Flores Manggarai 500g',
//               price: 150000,
//               rating: 4.9),
//           ProductCard(
//               imageUrl: 'assets/images/product/floresgourmet.png',
//               name: 'Flores Gourmet Coffee',
//               price: 35000,
//               rating: 4.9),
//           ProductCard(
//               imageUrl: 'assets/images/product/floresbajawa.png',
//               name: 'Flores Bajawa 200g Ko',
//               price: 75000,
//               rating: 5.0),
//           ProductCard(
//               imageUrl: 'assets/images/product/dripcoffee.png',
//               name: 'Drip Coffee 10g Arabic',
//               price: 50000,
//               rating: 4.8),
//           ProductCard(
//               imageUrl: 'assets/images/product/kopirobusta.png',
//               name: 'Kopi Robusta Watuag',
//               price: 25000,
//               rating: 4.5),
//           ProductCard(
//               imageUrl: 'assets/images/product/tehhijaudiet.png',
//               name: 'Single Origin Arabica Fl',
//               price: 80000),
//         ],
//       ),
//     );
//   }
// }
