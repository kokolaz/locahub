import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/services/network_services/cart_services.dart';
import 'package:locahub/core/services/network_services/favorite_services.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';
import 'package:locahub/core/views/checkout/cart/view/cart_page_view.dart';
import 'package:locahub/core/views/favorite/view/favorite.dart';
import 'package:locahub/core/views/homepage/controller/product_controller.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/product_card.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/homepage/view/widget/search_result/skeleton_product.dart';
import 'package:locahub/core/views/message_customer/view/detail_chat.dart';
import 'package:locahub/core/views/product/view/widget/customer_review.dart';
import 'package:locahub/core/views/product/view/customer_review_detail.dart';
import 'package:locahub/core/views/product/view/widget/other_product.dart';
import 'package:locahub/core/views/product/view/widget/product_information.dart';
import 'package:locahub/core/views/product/view/store_note_detail.dart';
import 'package:locahub/core/views/product/view/widget/variant.dart';
import 'package:locahub/core/views/store/view/store.dart';
import 'package:readmore/readmore.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../models/product_model.dart';

class DetailProduct extends StatefulWidget {
  final Products? product;
  const DetailProduct({Key? key, this.product}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  late ScrollController _scrollController;
  static const kExpandedHeight = 350.0;
  final productC = Get.find<ProductController>();
  final UserPrefService userPrefService = UserPrefService();
  final CartServices cartServices = CartServices();
  final FavoriteServices favoriteServices = FavoriteServices();

  @override
  void initState() {
    super.initState();
    productC.fetchProductsStore(id: widget.product?.storeId);
    productC.fetchProductsId(id: widget.product?.id);

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }

  int activeIndex = 0;

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: productC.isloadingDetail.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: kExpandedHeight,
                    backgroundColor: whiteColor,
                    pinned: true,
                    snap: false,
                    floating: false,
                    automaticallyImplyLeading: false,
                    leading: IconButton(
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

                    // show and hide SliverAppBar Title
                    title: _isSliverAppBarExpanded
                        ? Container(
                            margin: const EdgeInsets.only(right: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    productC.detailProduct.value.name ?? '',
                                    style: darkTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                const SizedBox(width: 25),
                                GestureDetector(
                                  child: isFavorite
                                      ? Icon(
                                          Icons.favorite,
                                          color: redColor,
                                          size: 20,
                                        )
                                      : Icon(
                                          Icons.favorite,
                                          color: darkgreyColor,
                                          size: 20,
                                        ),
                                  onTap: () {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        : null,

                    // show and hide FlexibleSpaceBar title
                    flexibleSpace: _isSliverAppBarExpanded
                        ? null
                        : FlexibleSpaceBar(
                            background: Stack(fit: StackFit.expand, children: [
                              if (widget.product!.galleries!.length == 1) ...[
                                Image.network(
                                  widget.product!.galleries![0].url.toString(),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                )
                              ] else ...[
                                CarouselSlider(
                                  items: widget.product!.galleries!
                                      .asMap()
                                      .map((index, e) => MapEntry(
                                            index,
                                            Image.network(
                                              Uri.tryParse(widget
                                                                  .product!
                                                                  .galleries!
                                                                  .length >
                                                              index
                                                          ? widget
                                                              .product!
                                                              .galleries![index]
                                                              .url
                                                              .toString()
                                                          : '')
                                                      ?.toString() ??
                                                  '',
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                            ),
                                          ))
                                      .values
                                      .toList(),
                                  options: CarouselOptions(
                                    viewportFraction: 1,
                                    aspectRatio: 1,
                                    onPageChanged: (index, reason) =>
                                        setState(() => activeIndex = index),
                                  ),
                                )
                              ],
                              Positioned.fill(
                                  child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 60),
                                        child: buildIndicator(),
                                      ))),
                            ]),
                          ),

                    // show and hide bottomBar title
                    bottom: _isSliverAppBarExpanded
                        ? null
                        : PreferredSize(
                            preferredSize: const Size.fromHeight(0),
                            child: Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.only(top: 30),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(10, -10),
                                      color: blackColor.withOpacity(0.05),
                                      blurRadius: 20)
                                ],
                              ),
                              child: Container(),
                            ),
                          ),
                  ),
                  SliverToBoxAdapter(
                    child: content(),
                  ),
                ],
              ),
        bottomNavigationBar: bottomButton(),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: widget.product!.galleries!.length,
        effect: ExpandingDotsEffect(
            dotHeight: 7,
            dotWidth: 7,
            activeDotColor: orangeColor,
            dotColor: whiteColor),
      );

  Widget content() {
    return Container(
      color: whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          generalInformation(),
          greyContainer(),
          variantProduct(),
          greyContainer(),
          storeDetail(),
          greyContainer(),
          productInformation(),
          greyContainer(),
          productDescription(),
          greyContainer(),
          storeNote(),
          greyContainer(),
          customerReview(),
          greyContainer(),
          otherProduct(),
          greyContainer(),
          similarProduct(),
        ],
      ),
    );
  }

  Widget bottomButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3,
            //offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            width: 55,
            height: 43,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: greyColor),
              child: Image.asset('assets/icon/messages.png'),
              onPressed: () {
                Get.to(const DetailChat());
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            width: 55,
            height: 43,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: greyColor),
              child: Image.asset('assets/icon/cart.png'),
              onPressed: () {
                bottomModal();
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: 43,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: orangeColor),
                child: Text(
                  'Beli',
                  style: whiteTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w700),
                ),
                //onPressed: () {},
                onPressed: () {
                  bottomModal();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future bottomModal() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      backgroundColor: whiteColor,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          height: 320,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Pilih Variasi',
                  style: darkTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 22, bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                                widget.product!.galleries![0].url.toString()),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: "id_ID",
                            name: "IDR",
                            symbol: "Rp ",
                            decimalDigits: 0,
                          ).format(double.parse(widget.product?.price ?? '0')),
                          overflow: TextOverflow.ellipsis,
                          style: darkTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Stok: 120',
                          style: darkTextStyle.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kemasan',
                      style: darkTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      children: [
                        VariantCard(
                          id: 1,
                          name: widget.product!.variation![0].name!,
                        ),
                        // const VariantCard(
                        //     id: 2, name: 'Bubuk Kopi', isActive: false),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 43,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: orangeColor),
                  child: Text(
                    'Beli Sekarang',
                    style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  onPressed: () {
                    String? token = userPrefService.readToken();
                    cartServices
                        .add(token!, widget.product!.id!)
                        .then((value) => Get.to(() => CartPageView())
                            //Get.to(CartPageView())
                            );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

//Widget dalam content
  Widget greyContainer() {
    return Container(
      height: 9,
      color: lightgreyColor,
    );
  }

  Widget generalInformation() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  productC.detailProduct.value.name ?? '',
                  style: darkTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(width: 25),
              !isFavorite
                  ? GestureDetector(
                      child: Icon(
                        Icons.favorite,
                        color: darkgreyColor,
                        size: 20,
                      ),
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                        String? token = userPrefService.readToken();
                        favoriteServices
                            .add(token!, widget.product!.id!)
                            .then((value) =>
                                //Get.to(const FavoritePage())
                                Get.to(() => const FavoritePage()));
                      },
                    )
                  : GestureDetector(
                      child: Icon(
                        Icons.favorite,
                        color: redColor,
                        size: 20,
                      ),
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                        String? token = userPrefService.readToken();
                        favoriteServices
                            .delete(token!, widget.product!.id!)
                            .then((value) => Get.to(const DetailProduct()));
                      },
                    )

              // GestureDetector(
              //   child: isFavorite
              //       ? Icon(
              //           Icons.favorite,
              //           color: redColor,
              //           size: 20,
              //         )
              //       : Icon(
              //           Icons.favorite,
              //           color: darkgreyColor,
              //           size: 20,
              //         ),
              //   onTap: () {
              //     setState(() {
              //       isFavorite = !isFavorite;
              //     });
              //   },
              // ),
            ],
          ),
          const SizedBox(height: 9),
          Text(
            NumberFormat.currency(
              locale: "id_ID",
              name: "IDR",
              symbol: "Rp ",
              decimalDigits: 0,
            ).format(double.parse(widget.product?.price ?? '0')),
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 13,
                color: orangeColor,
              ),
              const SizedBox(width: 5),
              Text(
                "${widget.product?.rating![0].rating} (3 ulasan)",
                // '4.9 (3 ulasan)',
                style: darkTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
              const SizedBox(width: 17),
              Image.asset('assets/icon/terjual.png', height: 13),
              const SizedBox(width: 5),
              Text(
                '5 terjual',
                style: darkTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget variantProduct() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 13, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Variasi',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          Wrap(
              children: widget.product!.variation!
                  .map(
                    (e) => VariantCard(id: 0, name: e.name ?? ""),
                  )
                  .toList()),
        ],
      ),
    );
  }

  Widget storeDetail() {
    return Container(
      margin: const EdgeInsets.only(top: 13, bottom: 13, left: 24, right: 24),
      child: Row(
        children: [
          productC.detailProduct.value.store?.image != null
              ? Container(
                  width: 57,
                  height: 57,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(widget.product?.store?.image ?? ""),
                        fit: BoxFit.cover),
                  ),
                )
              : Container(
                  width: 57,
                  height: 57,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/store/kioskopifloratama.png'),
                        fit: BoxFit.cover),
                  ),
                ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productC.detailProduct.value.store?.name ?? "",
                  //overflow: TextOverflow.ellipsis,
                  style: darkTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.location_on,
                        size: 13,
                        color: textmutedColor,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        productC.detailProduct.value.store?.addres ?? "",
                        //overflow: TextOverflow.ellipsis,
                        style: mutedTextStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 33),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StorePage(initialIndex: 0),
                ),
              );
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: darkgreyColor,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget productInformation() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 24, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informasi Produk',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          ProductInformationCard(
              information: 'Merek',
              description: productC.detailProduct.value.name ?? ''),
          ProductInformationCard(
              information: 'Kategori',
              description: productC.detailProduct.value.category?.name ?? ""),
          ProductInformationCard(
              information: 'Berat',
              description: '${widget.product?.weight} gram'),
          ProductInformationCard(
              information: 'Stok Produk',
              description: productC.detailProduct.value.wide ?? ""),
          ProductInformationCard(
              information: 'Dikirim dari',
              description: productC.detailProduct.value.store?.addres ?? ""),
        ],
      ),
    );
  }

  Widget productDescription() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 24, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deskripsi Produk',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          ReadMoreText(
            productC.detailProduct.value.productsInformation ?? "",
            trimLines: 3,
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
            colorClickableText: orangeColor,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Selengkapnya',
            moreStyle: orangeTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w700),
            trimExpandedText: ' Lebih Sedikit',
            lessStyle: orangeTextStyle.copyWith(
                fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget storeNote() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Catatan Toko',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      StoreNote(storeNote: widget.product!.store!.storeNote!),
                ),
              );
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: darkgreyColor,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget customerReview() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Penilaian Pembeli',
                      style: darkTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 13,
                          color: orangeColor,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${widget.product?.rating![0].rating} (3 ulasan)',
                          style: darkTextStyle.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    Get.to(() {
                      return CustomerReviewDetail(
                        product: widget.product,
                      );
                    });
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: darkgreyColor,
                    size: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 13),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          widget.product!.rating!.isNotEmpty
              ? CustomerReviewCard(widget.product)
              : Container()
        ],
      ),
    );
  }

  Widget otherProduct() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Produk lain dari toko ini',
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
                    'Selengkapnya',
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
      ),
    );
  }

  Widget similarProduct() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Produk Serupa',
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() {
                    return const SimilarProductDetail();
                  });
                },
                child: Text(
                  'Lihat Semua',
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
}

class SimilarProductDetail extends StatefulWidget {
  const SimilarProductDetail({super.key});

  @override
  State<SimilarProductDetail> createState() => _SimilarProductDetailState();
}

class _SimilarProductDetailState extends State<SimilarProductDetail> {
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
            "Produk Serupa",
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
        ),
        body: ListView(
          children: [
            greyContainer(),
            isLoading ? buildLoadingProduct() : buildProduct(),
          ],
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
