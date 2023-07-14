import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locahub/core/views/homepage/view/search_result.dart';
import 'package:locahub/core/views/homepage/view/widget/filter_page/category_filter.dart';
import 'package:locahub/core/views/homepage/view/widget/filter_page/rating_filter.dart';
import 'package:locahub/core/views/homepage/view/widget/filter_page/store_location.dart';
import '../../global/theme.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          //normalnya 56
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Filter",
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

            //isi halaman
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CategoryFilter(),
                  const StoreLocation(),
                  priceProduct(),
                  ratingProduct(),
                  buttonAction(),
                ],
              ),
            ),
          ],
        ));
  }

  Widget greyContainer() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 9,
      color: lightgreyColor,
    );
  }

  Widget priceProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Harga',
          style:
              darkTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                height: 43,
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    fillColor: lightgreyColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: lightgreyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: lightgreyColor),
                    ),
                    contentPadding: const EdgeInsets.only(top: 16),
                    hintText: 'Harga Minimal',
                    hintStyle: mutedTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text('-')),
            Expanded(
              child: SizedBox(
                height: 43,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    fillColor: lightgreyColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: lightgreyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: lightgreyColor),
                    ),
                    contentPadding: const EdgeInsets.only(top: 16),
                    hintText: 'Harga Maksimal',
                    hintStyle: mutedTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget ratingProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10, top: 18),
          child: Text(
            'Penilaian',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        Wrap(
          children: const [
            RatingProduct(id: 1, rating: 5),
            RatingProduct(id: 2, rating: 4),
            RatingProduct(id: 3, rating: 3),
            RatingProduct(id: 4, rating: 2),
            RatingProduct(id: 5, rating: 1),
            RatingProduct(id: 6, rating: 0),
          ],
        ),
      ],
    );
  }

  Widget buttonAction() {
    return Container(
      margin: const EdgeInsets.only(top: 60, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              height: 43,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: orangeColor),
                child: Text(
                  'Terapkan',
                  style: whiteTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w700),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) {
                        return const SearchResultPage(
                          text: "",
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 43,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: greyColor),
                child: Text(
                  'Reset',
                  style: darkTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w700),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) {
                        return const SearchResultPage(
                          text: "",
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
