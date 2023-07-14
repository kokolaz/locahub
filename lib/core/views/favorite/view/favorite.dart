import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/models/favorite_model.dart';
import 'package:locahub/core/models/user_model.dart';
import 'package:locahub/core/models/product_model.dart' as model;

import 'package:locahub/core/services/network_services/favorite_services.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/homepage/controller/main_controller.dart';
import 'package:locahub/core/views/homepage/controller/product_controller.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/product_card.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/skeleton_product.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool isLoading = true;
  late int userId;
  late FavoriteServices favoriteServices;
  late UserPrefService userPrefService;
  final ProductController productC = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    await Future.delayed(const Duration(seconds: 2));
    userPrefService = UserPrefService();
    String? token = userPrefService.readToken();
    User user = await MainController().getUsers();
    userId = user.id!;
    favoriteServices = FavoriteServices();
    favoriteServices.fetchFavoriteModels(token!, userId);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Favorite",
          style: darkTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
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
    String? token = userPrefService.readToken();
    return FutureBuilder<List<FavoriteModel>>(
      future: favoriteServices.fetchFavoriteModels(token!, userId),
      builder:
          (BuildContext context, AsyncSnapshot<List<FavoriteModel>> snapshot) {
        if (snapshot.hasData) {
          List<FavoriteModel> products = snapshot.data!;

          return Container(
            margin: const EdgeInsets.only(bottom: 16, right: 24, left: 24),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 13,
                mainAxisSpacing: 13,
                childAspectRatio: 2 / 3,
              ),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                model.Products product = productC.products[index];
                return ProductCard(
                  product: product,
                  imageUrl: product.galleries!.first.url!,
                  name: product.name!,
                  price: int.parse(product.price!),
                  rating: 5.0,
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return buildLoadingProduct();
        }
      },
    );
  }

  Widget greyContainer() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 9,
      color: lightgreyColor,
    );
  }
}

class Product {
  final String imageUrl;
  final String name;
  final int price;
  final double rating;

  Product({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.rating = 0.0,
  });
}
