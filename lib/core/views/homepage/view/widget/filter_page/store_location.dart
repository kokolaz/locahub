import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';

class StoreLocation extends StatefulWidget {
  const StoreLocation({super.key});

  @override
  State<StoreLocation> createState() => _StoreLocationState();
}

class _StoreLocationState extends State<StoreLocation> {
  final List<String> categoriesItems = [
    '- Pilih Lokasi Toko -',
    'Aceh',
    'Bali',
    'Bangka Belitung',
    'Banten',
    'Bengkulu',
    'DI Yogyakarta',
    'DKI Jakarta',
    'Gorontalo',
    'Jambi',
    'Jawa',
    'Kalimantan',
    'Kepulauan Riau',
    'Lampung',
    'Maluku',
    'Nusa Tenggara',
    'Riau',
    'Sulawesi',
    'Sumatera',
    'Papua',
    'Other',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lokasi Toko',
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
                '- Pilih Lokasi Toko -',
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
              //     return 'Please select store location.';
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
