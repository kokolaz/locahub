import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locahub/core/views/global/my_button.dart';
import 'package:locahub/core/views/global/my_form.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'package:locahub/core/views/profile/controller/edit_password_controller.dart';

class EditPasswordView extends GetView<EditPasswordController> {
  final MyButton _myButton = MyButton();
  final MyForm _myForm = MyForm();

  EditPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(EditPasswordController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            Get.back();
          },
          child: Icon(
            FontAwesomeIcons.chevronLeft,
            size: Get.width * 0.04,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Ganti Password",
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SizedBox(
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                thickness: Get.height * 0.01,
                color: lightgreyColor,
              ),
              SizedBox(
                height: Get.height * 0.035,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: Get.width * 0.4,
                  height: Get.width * 0.4,
                  child: Icon(
                    FontAwesomeIcons.lock,
                    color: orangeColor,
                    size: Get.width * 0.3,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    Text(
                      "Ganti Password",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Password minimal 8 karakter dengan kombinasi huruf kecil, huruf besar, angka dan karakter",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.035,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Obx(() {
                  return _myForm.passwordForm(
                    "Password Lama",
                    controller.currentPasswordController,
                    IconButton(
                      onPressed: () {
                        controller.currentPasswordObs.value =
                            !controller.currentPasswordObs.value;
                      },
                      icon: Icon(
                        controller.currentPasswordObs.value == true
                            ? FontAwesomeIcons.solidEye
                            : FontAwesomeIcons.solidEyeSlash,
                        size: 20,
                      ),
                    ),
                    isObscure: controller.currentPasswordObs.value,
                  );
                }),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Obx(() {
                  return _myForm.passwordForm(
                    "Password Baru",
                    controller.passwordController,
                    IconButton(
                      onPressed: () {
                        controller.passwordObs.value =
                            !controller.passwordObs.value;
                      },
                      icon: Icon(
                        controller.passwordObs.value == true
                            ? FontAwesomeIcons.solidEye
                            : FontAwesomeIcons.solidEyeSlash,
                        size: 20,
                      ),
                    ),
                    isObscure: controller.passwordObs.value,
                  );
                }),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Obx(() {
                  return _myForm.passwordForm(
                    "Ulangi Password",
                    controller.confirmPasswordController,
                    IconButton(
                      onPressed: () {
                        controller.confirmPasswordObs.value =
                            !controller.confirmPasswordObs.value;
                      },
                      icon: Icon(
                        controller.confirmPasswordObs.value == true
                            ? FontAwesomeIcons.solidEye
                            : FontAwesomeIcons.solidEyeSlash,
                        size: 20,
                      ),
                    ),
                    isObscure: controller.confirmPasswordObs.value,
                  );
                }),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: _myButton.btn(
                  "Simpan Perubahan",
                  func: () {
                    log('load');
                    controller.changePassword();
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
    );
  }
}
