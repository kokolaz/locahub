import 'package:get/get.dart';
import 'package:locahub/core/views/global/theme.dart';

customSnackbar(String title, String message, String type) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: type == "error" ? redColor : greenColor,
    colorText: whiteColor,
  );
}
