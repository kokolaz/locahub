import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/models/address_model.dart';
import 'package:locahub/core/services/network_services/address_service.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';
import 'package:locahub/core/views/address/view/add_address.dart';
import 'package:locahub/core/views/checkout/checkout_2/view/checkout_2_view.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListAddress extends StatefulWidget {
  final String token;
  final int? userId;

  const ListAddress({Key? key, required this.token, this.userId})
      : super(key: key);

  @override
  State<ListAddress> createState() => _ListAddressState();
}

class _ListAddressState extends State<ListAddress> {
  final int _selectedIndex = -1;
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AddressModel>(
      future: AddressService()
          .getAlamatbyUserID(widget.token, userId: widget.userId),
      builder: (BuildContext context, AsyncSnapshot<AddressModel> snapshot) {
        if (snapshot.hasData) {
          // If we have data, we can build the radio buttons
          var addresses = snapshot.data!.data.address.data;
          return Column(
            children: List<Widget>.generate(addresses.length, (int index) {
              Datum address = addresses[index];
              return Column(
                children: [
                  customRadioButton(
                      address: address.completeAddress,
                      index: index,
                      label: address.addressLabel,
                      name: address.name,
                      phone: address.phoneNumber,
                      district: address.district,
                      postcode: address.postcode),
                  Divider(thickness: 9, color: lightgreyColor),
                ],
              );
            }),
          );
        } else if (snapshot.hasError) {
          // If we have an error, we can show an error message
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          // If we don't have data yet, we can show a loading indicator
          return const Center(child: CircularProgressIndicator());
        } else {
          // If the returned AddressModel object is null, we can show a message
          return Column(
            children: [
              greyContainer(),
              Expanded(
                child: Center(
                  child: content(context),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget customRadioButton(
      {String? label,
      String? name,
      String? phone,
      String? address,
      String? district,
      String? postcode,
      int? index}) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          value = index!;
          print(value);
        });
        var data = {
          'address': address,
          'index': index,
          'label': label,
          'name': name,
          'phone': phone,
          'district': district,
          'postcode': postcode,
        };

// Convert the JSON object to a string
        String jsonString = json.encode(data);

// Save the string to shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs
            .setString('addressData', jsonString)
            .then((value) => Get.off(() => const Checkout2View()));
        //Get.back());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label!,
              style: darkTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name!,
                  style: darkTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Text(
                  '   |   ',
                  style: mutedTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Expanded(
                  child: Text(
                    '(+62) $phone',
                    style: darkTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Text(
              "${address!}, $district, $postcode",
              style: darkTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            value == index
                ? Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: orangeColor.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Image.asset("assets/icon/checklist.png"),
                                const SizedBox(width: 7),
                                Text(
                                  "Alamat Utama",
                                  style: orangeTextStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget greyContainer() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 9,
      color: lightgreyColor,
    );
  }

  Widget content(context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icon/address.png', height: 83),
          const SizedBox(height: 22),
          Text('Alamat',
              style: darkTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 5),
          Text(
              'Tambahkan alamat pengiriman Anda supaya dapat berbelanja di Locahub',
              textAlign: TextAlign.center,
              style: mutedTextStyle.copyWith(
                  fontSize: 12, fontWeight: FontWeight.w400)),
          const SizedBox(height: 24),
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
                'Tambah Alamat',
                style: whiteTextStyle.copyWith(fontSize: 14),
              ),
              onPressed: () async {
                var token = await UserPrefService.getToken();
                print(token);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) {
                      return const AddAddress();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
