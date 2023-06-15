import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:locahub/core/data/config.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';
import 'package:locahub/core/views/authentification/view/login_page.dart';
import 'package:locahub/core/views/authentification/view/widget/custom_snackbar.dart';

class EditPasswordController extends GetxController {
  final UserPrefService userPrefService = UserPrefService();
  RxBool currentPasswordObs = true.obs;
  RxBool passwordObs = true.obs;
  RxBool confirmPasswordObs = true.obs;
  late TextEditingController currentPasswordController,
      passwordController,
      confirmPasswordController;

  @override
  void onInit() {
    super.onInit();
    currentPasswordController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  changePassword() async {
    String token = userPrefService.readToken();
    var url = Uri.parse(
      AuthConfig.changePassword,
    );
    var response = await http.post(url,
        headers: ApiConfig.tokenHeader(token),
        body: jsonEncode({
          'current_password': currentPasswordController.text,
          'password': passwordController.text,
          'confirm_password': confirmPasswordController.text,
        }));
    print(response.body);
    if (response.statusCode == 200) {
      // var data = jsonDecode(response.body)['data'];
      customSnackbar("Success", "Silahkan Login Kembali", "success");
      Get.offAll(
        () => const LoginPage(),
      );
    } else {
      customSnackbar("Error", "Silahkan Ulang", "error");
    }
  }

  bottomSheet() async {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.25,
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
            Text(
              "Sukses",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              "Password Telah DIperbarui",
              style: GoogleFonts.poppins(
                fontSize: 12,
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
  }
}
