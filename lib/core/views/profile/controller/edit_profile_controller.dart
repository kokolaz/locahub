// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locahub/core/data/config.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';
import 'package:locahub/core/views/authentification/view/widget/custom_snackbar.dart';
import 'package:locahub/core/views/global/theme.dart';

class EditProfileController extends GetxController {
  final UserPrefService userPrefService = UserPrefService();
  TextEditingController bodController = TextEditingController();
  late TextEditingController nameController,
      usernameController,
      emailController,
      bioController,
      ttlController,
      phoneNumberController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    bioController = TextEditingController();
    ttlController = TextEditingController();
    usernameController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    bioController.dispose();
    ttlController.dispose();
    phoneNumberController.dispose();
  }

  editProfile() async {
    String token = userPrefService.readToken();
    var url = Uri.parse(
      ProfileConfig.updateUser,
    );
    var response = await http.post(url,
        headers: ApiConfig.tokenHeader(token),
        body: jsonEncode({
          'name': nameController.text,
          'email': emailController.text,
          'bio': bioController.text,
          'ttl': ttlController.text,
          'username': usernameController.text,
          'phone_number': phoneNumberController.text,
        }));
    print(response.body);
    if (response.statusCode == 200) {
      // var data = jsonDecode(response.body)['data'];
      await Get.bottomSheet(
        Container(
          height: 253,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.check,
                size: Get.width * 0.15,
                color: Colors.green,
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                "Sukses",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                "Profil Telah DIperbarui",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: textmutedColor,
                ),
              ),
            ],
          ),
        ),
        // barrierColor: Colors.red[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        enableDrag: false,
      );
    } else {
      customSnackbar("Error", "message", "error");
    }
  }
}
