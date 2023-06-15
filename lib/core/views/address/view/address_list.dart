import 'package:flutter/material.dart';
import 'package:locahub/core/views/address/view/add_address.dart';
import 'package:locahub/core/views/global/theme.dart';

class AddressList extends StatefulWidget {
  const AddressList({super.key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
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
              "Alamat",
              style: darkTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
            IconButton(
              padding: const EdgeInsets.only(right: 12),
              alignment: Alignment.centerRight,
              icon: Icon(
                Icons.add,
                color: textmutedColor,
                size: 20,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return const AddAddress();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          greyContainer(),
          content(),
        ],
      ),
    );
  }

  Widget greyContainer() {
    return Container(
      height: 9,
      color: lightgreyColor,
    );
  }

  Widget content() {
    return Column(
      children: const <Widget>[
        HomeAddress(
            label: 'Rumah Bondowoso',
            name: 'Eris Dwi Septiawan',
            telp: 85755055835,
            address:
                'Jl. Trunojoyo, No 89. Lombok Kulon, Wonosari, Kabupaten Bondowoso. 68282.',
            isActive: true),
        HomeAddress(
          label: 'Rumah Malang',
          name: 'Eris Dwi Septiawan',
          telp: 85755055835,
          address:
              'Jl. Terusan Lilin Emas Blok. 4 No. 3B, Dadaprejo, Junrejo, Kota Batu, Jawa Timur. 65323',
        ),
        HomeAddress(
          label: 'Kantor',
          name: 'Eris Dwi Septiawan',
          telp: 85755055835,
          address:
              'Jl. Selat Karimata E6/1, Sawojajar, Kota Malang, Jawa Timur. 65165',
        ),
      ],
    );
  }
}

class HomeAddress extends StatelessWidget {
  final String label;
  final String name;
  final int telp;
  final String address;
  final bool isActive;

  const HomeAddress(
      {super.key,
      required this.label,
      required this.name,
      required this.telp,
      required this.address,
      this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (_) {
            //       return const EditAddress();
            //     },
            //   ),
            // );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: darkTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
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
                        '(+62) $telp',
                        style: darkTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Text(
                  address,
                  style: darkTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                isActive != false
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
                    : Container()
              ],
            ),
          ),
        ),
        Divider(thickness: 9, color: lightgreyColor),
      ],
    );
  }
}
