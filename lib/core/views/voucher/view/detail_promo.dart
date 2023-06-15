import 'package:flutter/material.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:intl/intl.dart';
import 'package:locahub/core/views/voucher/view/promo_list.dart';

class DetailPromo extends StatefulWidget {
  const DetailPromo({super.key});

  @override
  State<DetailPromo> createState() => _DetailPromoState();
}

class _DetailPromoState extends State<DetailPromo> {
  String name = 'Gajian Seru';
  String code = 'GAJIANSERU';
  String startDate = '1 Oktober 2022';
  String endDate = '31 Oktober 2022';
  String voucher = 'voucher';
  int minimalOrder = 10000;
  int allStock = 100;
  int stock = 40;
  String status = 'Sedang Berjalan';
  String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum consequat pellentesque egestas. Fusce varius ligula ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum consequat pellentesque egestas. Fusce varius ligula ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum consequat pellentesque egestas. Fusce varius ligula ipsum.';

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
          "Syarat dan Ketentuan Promo",
          style:
              darkTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
        ),
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
      ),
      body: ListView(
        children: [
          greyContainer(),
          content(),
        ],
      ),
      bottomNavigationBar: bottomButton(),
    );
  }

  Widget greyContainer() {
    return Container(
      height: 9,
      color: lightgreyColor,
    );
  }

  Widget bottomButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 22, top: 22, left: 24, right: 24),
      width: double.infinity,
      height: 43,
      child: stock > 0
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: orangeColor),
              child: Text(
                'Gunakan Promo',
                style: whiteTextStyle.copyWith(fontSize: 14),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) {
                      return const PromoList();
                    },
                  ),
                );
              },
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: greyColor),
              child: Text(
                'Gunakan Promo',
                style: mutedTextStyle.copyWith(fontSize: 14),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) {
                      return const PromoList();
                    },
                  ),
                );
              },
            ),
    );
  }

  Widget content() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Promo',
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Kode Promo',
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Tanggal Mulai',
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Tanggal Selesai',
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Jenis Voucher',
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Min. Pembelian',
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Kuota',
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Sisa Kuota',
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'status',
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ':',
                    style: darkTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    ':',
                    style: darkTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    ':',
                    style: darkTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    ':',
                    style: darkTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    ':',
                    style: darkTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    ':',
                    style: darkTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    ':',
                    style: darkTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    ':',
                    style: darkTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    ':',
                    style: darkTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5),
              Expanded(
                //flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      code,
                      style: orangeTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      startDate,
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      endDate,
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      voucher,
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: "id_ID",
                              name: "Rupiah",
                              symbol: "Rp ",
                              decimalDigits: 0)
                          .format(minimalOrder),
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '$allStock',
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    stock > 0
                        ? Text(
                            '$stock',
                            style: darkTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : Text(
                            'habis',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: redColor),
                          ),
                    Text(
                      status,
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            description,
            style: darkTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
