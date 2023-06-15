//penghapusan sementara isi halaman favorit jd kosong biar sesuai akun baru yg harusnya kosong
import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/product_card.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/skeleton_product.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
          automaticallyImplyLeading: false,
          //normalnya 56
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Favorite",
            style: darkTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        body: Center(
          child: Text(
            "Tidak ada data",
            style: darkTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w400),
          ),
        )
        // ListView(
        //   children: [
        //     greyContainer(),
        //     isLoading ? buildLoadingProduct() : buildProduct(),
        //   ],
        // )
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

  Widget greyContainer() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 9,
      color: lightgreyColor,
    );
  }
}
