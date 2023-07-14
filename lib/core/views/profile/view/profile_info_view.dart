import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locahub/core/views/address/view/address.dart';
import 'package:locahub/core/views/homepage/controller/main_controller.dart';
import 'package:locahub/core/views/notification/view/notification.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/profile/controller/profile_controller.dart';
import 'package:locahub/core/views/profile/view/edit_password_view.dart';
import 'package:locahub/core/views/profile/view/edit_profile_view.dart';
import 'package:locahub/core/views/transaction_index/view/transaction_index_view.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  void _handleReturnedValue(value) {
    if (value == 'refresh') {
      // Trigger a refresh here
      // getAddressData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final mainC = Get.find<MainController>();
    Get.put(ProfileController());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Page',
      home: Scaffold(
        backgroundColor: whiteColor,
        body: SizedBox(
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: Get.width,
                      child: Image.asset(
                        'assets/images/hiasan.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).padding.top,
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 58,
                                      height: 58,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: orangeColor.withAlpha(51),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Icon(
                                          FontAwesomeIcons.solidUser,
                                          size: 50,
                                          color: orangeColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            mainC.users.value.name ?? '',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: darkColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "@${mainC.users.value.username ?? ''}",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: textmutedColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 0),
                                  alignment: Alignment.topRight,
                                  splashRadius: 25,
                                  icon: Icon(
                                    Icons.notifications,
                                    color: darkColor,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) {
                                          return const NotificationPage();
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Pesanan Saya",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: darkColor,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() {
                                        return const TransactionIndexView();
                                        //return const NotYetPaid();
                                        //return const Packed();
                                        // return const Sent();
                                        //return const OrderArrived();
                                        //return const Canceled();
                                        //return const OrderCompleted();
                                        //return const OrderCompletedAfterReview();
                                      });
                                    },
                                    child: Text(
                                      "Lihat Semua",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: orangeColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.anglesRight,
                                    size: 10,
                                    color: orangeColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              orderMenu(
                                FontAwesomeIcons.wallet,
                                "Blm Bayar",
                                23.33,
                              ),
                              orderMenu(
                                FontAwesomeIcons.boxesStacked,
                                "Dikemas",
                                23.7,
                              ),
                              orderMenu(
                                FontAwesomeIcons.truckFast,
                                "Dikirim",
                                21.33,
                              ),
                              orderMenu(
                                FontAwesomeIcons.checkToSlot,
                                "Selesai",
                                18.67,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  thickness: 9,
                  color: lightgreyColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        "AKUN SAYA",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: darkColor,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      accountMenu(
                        FontAwesomeIcons.solidUser,
                        "Profil",
                        func: () {
                          Get.to(
                            () => EditProfileView(
                              name: mainC.users.value.name,
                              bio: mainC.users.value.bio ?? "",
                              email: mainC.users.value.email ?? "",
                              photo: mainC.users.value.profilePhotoUrl ?? "",
                              tanggalLahir: mainC.users.value.ttl ?? "",
                              telepon: mainC.users.value.phoneNumber ?? "",
                              username: mainC.users.value.username ?? "",
                            ),
                          );
                        },
                      ),
                      accountMenu(
                        FontAwesomeIcons.lock,
                        "Ganti Password",
                        func: () {
                          Get.to(
                            () => EditPasswordView(),
                          );
                        },
                      ),
                      accountMenu(
                        FontAwesomeIcons.locationDot,
                        "Alamat",
                        func: () {
                          Get.to(() =>
                              Address(onReturnedValue: _handleReturnedValue));
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 9,
                  color: lightgreyColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        "LOCAHUBIE",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      accountMenu(
                        FontAwesomeIcons.solidBuilding,
                        "Tentang Kami",
                      ),
                      accountMenu(
                        FontAwesomeIcons.solidCircleQuestion,
                        "Pusat Bantuan",
                      ),
                      accountMenu(
                        FontAwesomeIcons.clipboardList,
                        "Kebijakan Privasi",
                      ),
                      accountMenu(
                        FontAwesomeIcons.clipboardList,
                        "Syarat dan Ketentuan",
                      ),
                      accountMenu(
                        FontAwesomeIcons.solidStar,
                        "Nilai Kami di Playstore",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 9,
                  color: lightgreyColor,
                ),
                const SizedBox(
                  height: 21,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 24,
                //   ),
                //   child: SizedBox(
                //     width: double.infinity,
                //     height: 43,
                //     child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           backgroundColor: orangeColor),
                //       child: Text(
                //         'Logout',
                //         style: poppinsTextStyle.copyWith(
                //             fontSize: 14, fontWeight: FontWeight.w700),
                //       ),
                //       onPressed: () async {
                //         controller.logout();
                //       },
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: InkWell(
                    onTap: () async {
                      controller.logout();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10),
                        color: orangeColor,
                      ),
                      child: Center(
                        child: Text(
                          "Logout",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget accountMenu(IconData iconData, String label, {Function()? func}) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        func != null ? func() : () {};
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        // height: 15,
        child: Row(
          children: [
            Icon(
              iconData,
              size: 20,
              color: orangeColor,
            ),
            const SizedBox(
              width: 14,
            ),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: darkColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderMenu(IconData iconData, String label, double iconSize) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: orangeColor.withAlpha(51),
          ),
          child: Icon(
            iconData,
            color: orangeColor,
            size: iconSize,
          ),
        ),
        SizedBox(
          height: Get.width * 0.015,
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
