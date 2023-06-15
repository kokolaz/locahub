import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:async';

class EditAddress extends StatefulWidget {
  const EditAddress({super.key});

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
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
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                padding: const EdgeInsets.only(left: 12),
                alignment: Alignment.centerLeft,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: darkgreyColor,
                  size: 14,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Text(
                "Ubah Alamat",
                style: darkTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              GestureDetector(
                onTap: () {
                  deleteConfirmModal();
                },
                child: Container(
                    padding: const EdgeInsets.only(right: 12),
                    alignment: Alignment.centerRight,
                    child: Image.asset("assets/icon/trash.png", width: 16)),
              ),
            ],
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
          Province(),
          City(),
          District(),
          PostalCode(),
          fullAddress(),
          detailAddress(),
          const SwitchButton(),
          buttonSubmit(),
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
                hintText: 'Rumah Bondowoso',
                hintStyle: darkTextStyle.copyWith(
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
                hintText: 'Eris Dwi Septiawan Rizal',
                hintStyle: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
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
                    hintStyle: darkTextStyle.copyWith(
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
                      hintText: '8575505583',
                      hintStyle: darkTextStyle.copyWith(
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
              hintText: 'Jl. Trunojoyo 89 Lombok Kulon',
              hintStyle: darkTextStyle.copyWith(
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
            hintText: 'Toko Eris',
            hintStyle: darkTextStyle.copyWith(
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
          'Simpan Perubahan',
          style: whiteTextStyle.copyWith(fontSize: 14),
        ),
        onPressed: () {
          bottomModal();
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
            margin: const EdgeInsets.only(top: 25),
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
                Text('Perubahan alamat telah disimpan.',
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

  Future deleteModal() {
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
            margin: const EdgeInsets.only(top: 25),
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
                Text('Alamat berhasil dihapus.',
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

  Future deleteConfirmModal() {
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
          child: Container(
            margin: const EdgeInsets.only(top: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icon/red_trash.png', height: 40),
                const SizedBox(height: 19),
                Text('Yakin?',
                    style: darkTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 14),
                Text('Data akan dihapus secara permanen oleh sistem.',
                    textAlign: TextAlign.center,
                    style: mutedTextStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.w400)),
                const SizedBox(height: 30),
                Row(
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
                              backgroundColor: greyColor),
                          child: Text(
                            'Batal',
                            style: darkTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
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
                              backgroundColor: redColor),
                          child: Text(
                            'Hapus',
                            style: whiteTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            deleteModal();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                //const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}

//Switch Button
class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool status = false;
  bool isSwitchOn = false;

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
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
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
//

class Province extends StatelessWidget {
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

  late final String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  Province({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Jawa Timur',
                style: darkTextStyle.copyWith(
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

class City extends StatelessWidget {
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
    'Wonosobo',
    'Other',
  ];

  late final String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  City({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Kabupaten Bondowoso',
                style: darkTextStyle.copyWith(
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

class District extends StatelessWidget {
  final List<String> categoriesItems = [
    '- Pilih Kecamatan -',
    'Kedungkandang',
    'Klojen',
    'Lowokwaru',
    'Pakis',
    'Pakisaji',
    'Wonosari',
    'Other',
  ];

  late final String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  District({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Kecamatan Wonosari',
                style: darkTextStyle.copyWith(
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

class PostalCode extends StatelessWidget {
  final List<String> categoriesItems = [
    '- Pilih Kode Pos -',
    '65115',
    '65113',
    '65213',
    '65125',
    '68282',
  ];

  late final String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  PostalCode({super.key});

  @override
  Widget build(BuildContext context) {
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
                '68282',
                style: darkTextStyle.copyWith(
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
