import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({super.key});

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  final List<String> categoriesItems = [
    '- Pilih Kategori Produk -',
    'Herbal',
    'Kesehatan',
    'Kuliner',
    'Fashion',
    'Agribisnis',
    'Kecantikan',
    'Kerajinan Tangan',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18, bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kategori Produk',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          Form(
            key: _formKey,
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                isDense: true,
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
              ),
              hint: Text(
                '- Pilih Kategori Produk -',
                style: mutedTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: textmutedColor,
              ),
              dropdownDecoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              items: categoriesItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: darkTextStyle.copyWith(fontSize: 14),
                        ),
                      ))
                  .toList(),
              // validator: (value) {
              //   if (value == null) {
              //     return 'Please select category.';
              //   }
              // },
              onChanged: (value) {
                //Do something when changing the item if you want.
              },
              onSaved: (value) {
                selectedValue = value.toString();
              },
            ),
          ),
        ],
      ),
    );
  }
}
