import 'package:flutter/material.dart';
import 'package:locahub/core/models/user_model.dart';
import 'package:locahub/core/services/network_services/address_service.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';
import 'package:locahub/core/views/address/view/address_list.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:async';

import 'package:locahub/core/views/homepage/controller/main_controller.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  slideAddressList() async {
    var duration = const Duration(seconds: 2);
    return Timer(
      duration,
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) {
              return const AddressList();
            },
          ),
        );
      },
    );
  }

  final UserPrefService userPrefService = UserPrefService();
  final AddressService addressServices = AddressService();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController labelController = TextEditingController();
  final TextEditingController detailAddressController = TextEditingController();
  bool switchStatus = false;

  void handleSwitchStatus(bool status) {
    setState(() {
      switchStatus = status;
    });
  }

  late final String? provinceValue;
  late final int? provinceInt;
  late final String? cityValue;
  late final int? cityVal;
  late final String? districtValue;
  late final String? postalCodeValue;

  final _formKey = GlobalKey<FormState>();
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
            "Tambah Alamat",
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
            content(),
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

  Widget content() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          addressLabel(),
          fullName(),
          phoneNumber(),
          // Province(),
          provinsiDropdown(),
          cityDropdown(),
          districtDropdown(),
          postalCode(),
          fullAddress(),
          detailAddress(),
          SwitchButton(
            onStatusChanged: handleSwitchStatus,
          ),
          buttonSubmit(),
        ],
      ),
    );
  }

  Container postalCode() {
    final List<String> categoriesItems = [
      '- Pilih Kode Pos -',
      '65115',
      '65113',
      '65213',
      '65125',
    ];
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kode Pos',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 9),
          DropdownButtonFormField2(
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
              '- Pilih Kode Pos -',
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
              // Do something with the selected value if you want
              print('Selected item value: $value');
              postalCodeValue = value.toString();
            },
            onSaved: (value) {
              postalCodeValue = value.toString();
              print(value);
            },
          ),
        ],
      ),
    );
  }

  Container districtDropdown() {
    final List<String> categoriesItems = [
      '- Pilih Kecamatan -',
      'Kedungkandang',
      'Klojen',
      'Lowokwaru',
      'Pakis',
      'Pakisaji',
      'Other',
    ];
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kecamatan',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 9),
          DropdownButtonFormField2(
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
              '- Pilih Kecamatan -',
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
              // Do something with the selected value if you want
              districtValue = value.toString();

              print('Selected item value: $value');
            },
            onSaved: (value) {
              districtValue = value.toString();

              print(value);
            },
          ),
        ],
      ),
    );
  }

  Container cityDropdown() {
    final List<String> categoriesItems = [
      '- Pilih Kota/Kabupaten -',
      'Batam',
      'Kendari',
      'Madiun',
      'Malang',
      'Sidoarjo',
      'Solo',
      'Surabaya',
      'Unaha',
      'Other',
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kota/Kabupaten',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 9),
          DropdownButtonFormField2(
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
              '- Pilih Kota/Kabupaten -',
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

              // Retrieve the index of the selected item from the list
              final index = categoriesItems.indexOf(value!);
              cityVal = index;
              // Do something with the index if you want
              print('Selected item index: $index');

              // Do something with the selected value if you want
              print('Selected item value: $value');
            },
            onSaved: (value) {
              cityValue = value.toString();
              final index = categoriesItems.indexOf(value!);
              cityVal = index;
              print(value);
            },
          ),
        ],
      ),
    );
  }

  Container provinsiDropdown() {
    final List<String> categoriesItems = [
      '- Pilih Provinsi -',
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
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Provinsi',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 9),
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
                '- Pilih Provinsi -',
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

                // Retrieve the index of the selected item from the list
                final index = categoriesItems.indexOf(value!);
                provinceInt = index;
                // Do something with the index if you want
                print('Selected item index: $index');

                // Do something with the selected value if you want
                print('Selected item value: $value');
              },
              onSaved: (value) {
                provinceValue = value.toString();
                final index = categoriesItems.indexOf(value!);
                provinceInt = index;
                print(value);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget addressLabel() {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Label Alamat',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 9),
          SizedBox(
            height: 50,
            child: TextFormField(
              controller: labelController,
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
                hintText: 'Alamat Rumah, Kos, Kantor, dll',
                hintStyle: mutedTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget fullName() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nama Lengkap',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 9),
          SizedBox(
            height: 50,
            child: TextFormField(
              controller: namaController,
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
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget phoneNumber() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Telepon',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 9),
          Row(
            children: [
              SizedBox(
                width: 70,
                height: 50,
                child: TextFormField(
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
                    hintText: '+62',
                    hintStyle: mutedTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextFormField(
                    controller: phoneController,
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
                      hintText: '',
                      hintStyle: mutedTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget fullAddress() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alamat Lengkap',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 9),
          TextFormField(
            controller: addressController,
            maxLines: 4,
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
              hintText: 'Tulis nama jalan, nomor jalan, RT/RW',
              hintStyle: mutedTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  Widget detailAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detail Alamat',
          style:
              darkTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 9),
        TextFormField(
          controller: detailAddressController,
          maxLines: 4,
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
            hintText: 'Tulis patokan, warna rumah, dll',
            hintStyle: mutedTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  Widget buttonSubmit() {
    return SizedBox(
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
          //bottomModal();
          // void initState() {
          //   super.initState();
          //   slideAddressList();
          // }
          String? token = userPrefService.readToken();
          Future<User> usera = MainController().getUsers();
          int userId = await usera.then((user) => user.id!);
          print(token);
          print(userId);
          addressServices.add(
            address: addressController.text,
            detailAddress: detailAddressController.text,
            addressLabel: labelController.text,
            completeAddress: addressController.text,
            cityId: cityVal!,
            district: districtValue!,
            name: namaController.text,
            phoneNumber: phoneController.text,
            postcode: int.tryParse(postalCodeValue!)!,
            provinceId: provinceInt!,
            token: token!,
            userId: userId.toString(),
          );

          print(provinceInt);
          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(
          //     builder: (_) {
          //       return const AddressList();
          //     },
          //   ),
          // );
        },
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
          height: 250,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: whiteColor,
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 24, right: 24, top: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icon/success.png', height: 40),
                const SizedBox(height: 26),
                Text('Sukses',
                    style: darkTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 14),
                Text('Alamat baru Anda telah ditambahkan.',
                    textAlign: TextAlign.center,
                    style: mutedTextStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.w400)),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}

//Switch Button
typedef OnStatusChanged = void Function(bool);

class SwitchButton extends StatefulWidget {
  final OnStatusChanged onStatusChanged;

  const SwitchButton({Key? key, required this.onStatusChanged})
      : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool status = false;
  bool isSwitchOn = false;

  void switchButton(bool val) {
    setState(() {
      status = val;
      widget.onStatusChanged(status);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18, bottom: 28),
      child: Row(
        children: [
          FlutterSwitch(
            activeColor: orangeColor.withOpacity(0.2),
            inactiveColor: greyColor,
            activeToggleColor: orangeColor,
            inactiveToggleColor: textmutedColor,
            width: 42.0,
            height: 25.0,
            valueFontSize: 12.5,
            toggleSize: 17.0,
            value: status,
            onToggle: switchButton,
          ),
          const SizedBox(width: 10),
          Text(
            'Tandai sebagai alamat utama',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
