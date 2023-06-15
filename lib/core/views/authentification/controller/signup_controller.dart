import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:locahub/core/views/authentification/view/widget/custom_snackbar.dart';

import '../../../data/config.dart';
import '../view/login_page.dart';
import '../view/widget/loading_button.dart';

class SigunpController extends GetxController {
  late TextEditingController nameController,
      usernameController,
      emailController,
      passwordController,
      phoneNumberController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
  }

  checkSignup() {
    if (nameController.text.isEmpty) {
      customSnackbar("Error", "name is required", "error");
      return;
    } else if (usernameController.text.isEmpty) {
      customSnackbar("Error", "username is required", "error");
      return;
    } else if (emailController.text.isEmpty ||
        GetUtils.isEmail(emailController.text) == false) {
      customSnackbar("Error", "a valid email is required", "error");
      return;
    } else if (passwordController.text.isEmpty) {
      customSnackbar("Error", "password is required", "error");
      return;
    } else if (phoneNumberController.text.isEmpty) {
      customSnackbar("Error", "phone_number is required", "error");
      return;
    } else {
      Get.showOverlay(
          asyncFunction: () => signup(), loadingWidget: LoadingButton());
    }
  }

  signup() async {
    var url = Uri.parse(AuthConfig.register);
    var response = await http.post(url,
        headers: ApiConfig.header,
        body: jsonEncode({
          "name": nameController.text,
          "username": usernameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "phone_number": phoneNumberController.text,
        }));
    print(response.body);
    if (response.statusCode == 200) {
      // var data = jsonDecode(response.body)['data'];
      customSnackbar("Success", "message", "success");
      Get.offAll(
        () => const LoginPage(),
      );
    } else {
      customSnackbar("Error", "message", "error");
    }
  }
}
