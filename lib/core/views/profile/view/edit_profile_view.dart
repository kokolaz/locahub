import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locahub/core/views/global/my_button.dart';
import 'package:locahub/core/views/global/my_form.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/profile/controller/edit_profile_controller.dart';
import 'package:get/get.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({
    super.key,
    required this.name,
    required this.username,
    required this.telepon,
    required this.tanggalLahir,
    required this.bio,
    required this.email,
    required this.photo,
  });
  final dynamic name;
  final dynamic username;
  final dynamic telepon;
  final dynamic tanggalLahir;
  final dynamic bio;
  final dynamic email;
  final dynamic photo;

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final MyButton _myButton = MyButton();

  final MyForm _myForm = MyForm();

  @override
  void initState() {
    super.initState();
    // super.initState();
    controller.nameController.text = widget.name;
    controller.usernameController.text = widget.username;
    controller.phoneNumberController.text = widget.telepon;
    controller.ttlController.text = widget.tanggalLahir;
    controller.bioController.text = widget.bio;
    controller.emailController.text = widget.email;
  }

  final EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SizedBox(
          height: Get.height,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 21),
                        decoration: BoxDecoration(
                          color: whiteColor,
                        ),
                        child: Text(
                          "Info Profil",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: darkColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 27.95,
                    top: 24,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SizedBox(
                        height: 18,
                        width: 18,
                        child: Icon(
                          FontAwesomeIcons.chevronLeft,
                          size: 13.33,
                          color: textmutedColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        thickness: Get.height * 0.01,
                        color: lightgreyColor,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 148,
                          height: 148,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: orangeColor.withAlpha(51),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Icon(
                              FontAwesomeIcons.solidUser,
                              color: orangeColor,
                              size: 118,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 42,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: _myForm.normalForm(
                              'Name', context, controller.nameController,
                              hintText: "Jajang Nurjaman",
                              intialValue: "Jajang Nurjaman")),
                      const SizedBox(
                        height: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _myForm.normalForm(
                              "Username",
                              context,
                              controller.usernameController,
                              intialValue: "EclaireLatte",
                              hintText: "EclairLatte",
                              // readOnly: true,
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            // Text(
                            //   "Username tidak dapat diubah",
                            //   style: GoogleFonts.poppins(
                            //     fontSize: 12,
                            //     color: orangeColor,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: _myForm.cidPhone("No. Telepon", context,
                            controller.phoneNumberController,
                            intialValue01: "+62"),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: _myForm.dateForm(
                          context,
                          controller.ttlController,
                          "Tanggal Lahir",
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: _myForm.growableForm(
                            "Bio", context, controller.bioController),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: _myForm.normalForm(
                            "Email", context, controller.emailController,
                            hintText: "email@domain.id"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: _myButton.btn(
                          "Simpan Perubahan",
                          func: () {
                            log("load");
                            controller.editProfile();
                          },
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
