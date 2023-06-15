import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:locahub/core/views/address/view/address_list.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:locahub/core/views/voucher/view/promo_list.dart';

import '../../../cart/controller/cart_controller.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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
          "Atur Barang Belanjaan",
          style:
              darkTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
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

  Widget content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        greyContainer(),
        const HomeAddress(),
        greyContainer(),
        const SwitchButton(),
        greyContainer(),
        const ProductCheckout(),
        greyContainer(),
        const Delivery(),
        greyContainer(),
        const PaymentMethod(),
        greyContainer(),
        const Promotion(),
        greyContainer(),
        TotalPayment(),
      ],
    );
  }

  Widget bottomButton() {
    int subtotal = 296000;
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
          SizedBox(
            height: 43,
            width: 111,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Pembayaran',
                  style: darkTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Text(
                  NumberFormat.currency(
                          locale: "id_ID",
                          name: "Rupiah",
                          symbol: "Rp ",
                          decimalDigits: 0)
                      .format(subtotal),
                  style: orangeTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 128,
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
              onPressed: () {
                //deliveryModal();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeAddress extends StatelessWidget {
  final String name = 'Eris Dwi Septiawan';
  final int telp = 85755055835;
  final String address =
      'Jl. Trunojoyo, No 89. Lombok Kulon, Wonosari, Kabupaten Bondowoso. 68282.';

  const HomeAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Alamat Rumah',
                style: darkTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return const AddressList();
                      },
                    ),
                  );
                },
                child: Text(
                  'Ubah',
                  style: orangeTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 11, bottom: 14),
            child: Divider(
              thickness: 1,
              color: greyColor,
            ),
          ),
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
        ],
      ),
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
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
            'Kirim sebagai dropshipper',
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
//

class ProductCheckout extends GetView<CartController> {
  const ProductCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.put(ChartController());
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          for (var i = 0; i < controller.item.length; i++)
            Column(
              children: [
                controller.item[i]["store"]["is_checked"] != false
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              children: [
                                Text(controller.item[i]["store"]["name"],
                                    style: darkTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Divider(
                              thickness: 1,
                              color: lightgreyColor,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
                for (var j = 0;
                    j < controller.item[i]["store"]["item"].length;
                    j++)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: controller.item[i]["store"]["item"][j]
                                ["is_checked"] !=
                            false
                        ? Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 76,
                                    width: 76,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: orangeColor,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        controller.item[i]["store"]["item"][j]
                                            ["image"],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Obx(() {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                              controller.item[i]["store"]
                                                  ["item"][j]["name"],
                                              style: darkTextStyle.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400)),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          controller.item[i]["store"]["item"][j]
                                                      ["variant"] !=
                                                  null
                                              ? Column(
                                                  children: [
                                                    Text.rich(
                                                      TextSpan(
                                                          text:
                                                              "Variasi: ${controller.item[i]["store"]["item"][j]["variant"]["name"]}",
                                                          style: mutedTextStyle
                                                              .copyWith(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                )
                                              : const SizedBox(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text.rich(
                                                TextSpan(
                                                    text: controller.item[i]["store"]["item"][j]["discount_price"] !=
                                                            null
                                                        ? NumberFormat.currency(
                                                            locale: "id_ID",
                                                            name: "IDR",
                                                            symbol: "Rp ",
                                                            decimalDigits: 0,
                                                          ).format(controller.item[i]
                                                                    ["store"]
                                                                ["item"][j]
                                                            ["discount_price"])
                                                        : NumberFormat.currency(
                                                            locale: "id_ID",
                                                            name: "IDR",
                                                            symbol: "Rp ",
                                                            decimalDigits: 0,
                                                          ).format(controller.item[i]
                                                                ["store"]["item"]
                                                            [j]["price"]),
                                                    style: darkTextStyle.copyWith(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    children: [
                                                      const TextSpan(text: " "),
                                                      controller.item[i]["store"]
                                                                      [
                                                                      "item"][j]
                                                                  [
                                                                  "discount_price"] !=
                                                              null
                                                          ? TextSpan(
                                                              text: NumberFormat
                                                                  .currency(
                                                                locale: "id_ID",
                                                                name: "IDR",
                                                                symbol: "Rp ",
                                                                decimalDigits:
                                                                    0,
                                                              ).format(controller
                                                                          .item[i]
                                                                      [
                                                                      "store"]["item"]
                                                                  [j]["price"]),
                                                              style: mutedTextStyle.copyWith(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough),
                                                            )
                                                          : const TextSpan(),
                                                    ]),
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                    text:
                                                        "${controller.item[i]["store"]["item"][j]["qty"]} pcs",
                                                    style:
                                                        mutedTextStyle.copyWith(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 14,
                                          ),
                                        ],
                                      );
                                    }),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

//Delivery
class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pengiriman',
                    style: darkTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Reguler',
                          style: darkTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: NumberFormat.currency(
                            locale: "id_ID",
                            name: "IDR",
                            symbol: "Rp ",
                            decimalDigits: 0,
                          ).format(26000),
                          style: darkTextStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Estimasi sampai pada 17-18 Agustus 2021',
                    style: darkTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {
                deliveryModal();
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: darkgreyColor,
                size: 14,
              ),
            ),
          ],
        ));
  }

  Future deliveryModal() {
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
          height: 330,
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
                  'Opsi Pengiriman',
                  style: darkTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 35),
              const DeliveryModalCard(
                  name: 'Gratis Ongkir',
                  estimation: '17 - 18 Agustus',
                  price: 0),
              const DeliveryModalCard(
                  name: 'Reguler', estimation: '17 - 19 Agustus', price: 26000),
              const DeliveryModalCard(
                  name: 'Kargo', estimation: '17 - 20 Agustus', price: 20000)
            ],
          ),
        );
      },
    );
  }
}

class DeliveryModalCard extends StatelessWidget {
  final String name;
  final String estimation;
  final int price;
  const DeliveryModalCard(
      {super.key,
      required this.name,
      required this.estimation,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: darkTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Estimasi sampai pada $estimation',
                  style: mutedTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Text(
            NumberFormat.currency(
              locale: "id_ID",
              name: "IDR",
              symbol: "Rp ",
              decimalDigits: 0,
            ).format(price),
            style: darkTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
//

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Metode Pembayaran',
                    style: darkTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Midtrans',
                    style: darkTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class Promotion extends StatelessWidget {
  const Promotion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/icon/percentage.png'),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gunakan Promo',
                    style: darkTextStyle.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'HARBOLNAS2121',
                    style: mutedTextStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PromoList(),
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
        ));
  }
}

class TotalPayment extends StatelessWidget {
  final List<String> information = [
    "Total Belanja",
    "Diskon Belanja",
    "Ongkos Kirim",
    "Diskon Ongkos Kirim"
  ];

  final int total = 30000;
  final int discount = 2500;
  final int postage = 26000;
  final int postagediscount = 0;
  final int subtotal = 53500;

  TotalPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 30, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Pembayaran',
              style: darkTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...information.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Text(
                            i,
                            style: darkTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          );
                        },
                      );
                    }).toList(),
                    Text(
                      'Total',
                      style: darkTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: "id_ID",
                        name: "IDR",
                        symbol: "Rp ",
                        decimalDigits: 0,
                      ).format(total),
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    discount > 0
                        ? Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(text: '- '),
                                TextSpan(
                                  text: NumberFormat.currency(
                                    locale: "id_ID",
                                    name: "IDR",
                                    symbol: "Rp ",
                                    decimalDigits: 0,
                                  ).format(discount),
                                  style: darkTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const Text('0'),
                    Text(
                      NumberFormat.currency(
                        locale: "id_ID",
                        name: "IDR",
                        symbol: "Rp ",
                        decimalDigits: 0,
                      ).format(postage),
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    postagediscount > 0
                        ? Text(
                            NumberFormat.currency(
                              locale: "id_ID",
                              name: "IDR",
                              symbol: "Rp ",
                              decimalDigits: 0,
                            ).format(postagediscount),
                            style: darkTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : const Text('0'),
                    Text(
                      NumberFormat.currency(
                        locale: "id_ID",
                        name: "IDR",
                        symbol: "Rp ",
                        decimalDigits: 0,
                      ).format(subtotal),
                      style: darkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
