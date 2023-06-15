import 'package:flutter/material.dart';
import '../../global/theme.dart';
import 'widget/search_page/popular_search.dart';
import 'widget/search_page/history_search.dart';
import 'search_result.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget searchBar() {
      return Container(
        height: 43,
        margin: const EdgeInsets.only(bottom: 22),
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
              borderSide: BorderSide(color: blackColor.withOpacity(0.05)),
            ),
            contentPadding: const EdgeInsets.only(top: 16, left: 16),
            hintText: 'Cari apa saja',
            hintStyle: mutedTextStyle.copyWith(
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
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Page',
      home: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          //normalnya 56
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Cari Produk",
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
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            children: [
              searchBar(),
              historySearchFunc(),
              popularSearchFunc(),
            ]),
      ),
    );
  }

  Widget historySearchFunc() {
    return Column(
      children: [
        const HistorySearchCard(historySearch: 'Jamu Beras Kencur'),
        const HistorySearchCard(historySearch: 'Beras Kencur Sachet'),
        const HistorySearchCard(historySearch: 'Beras Organik'),
        const HistorySearchCard(historySearch: 'Beras Merah'),
        Container(
          margin: const EdgeInsets.only(top: 16, bottom: 28),
          child: Center(
            // child: GestureDetector(
            //             onTap: () {
            //               Navigator.of(context).push(
            //                 MaterialPageRoute(
            //                   builder: (context) => SearchPage(),
            //                 ),
            //               );
            //             },
            //             child: Text('Selengkapnya',
            //                 style: orangeTextStyle.copyWith(
            //                     fontWeight: FontWeight.w700, fontSize: 12))),
            child: Text('Selengkapnya',
                style: orangeTextStyle.copyWith(
                    fontWeight: FontWeight.w700, fontSize: 12)),
          ),
        ),
      ],
    );
  }

  Widget popularSearchFunc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Text('Pencarian Populer',
              style: darkTextStyle.copyWith(
                  fontWeight: FontWeight.w700, fontSize: 16)),
        ),
        Wrap(
          children: const [
            PopularSearchCard(popularSearch: 'Beras Organik'),
            PopularSearchCard(popularSearch: 'Kopi Arabica Ijen'),
            PopularSearchCard(popularSearch: 'Jamu Herbal'),
            PopularSearchCard(popularSearch: 'Jahe Instan'),
            PopularSearchCard(popularSearch: 'Teh Hijau'),
          ],
        ),
      ],
    );
  }
}
