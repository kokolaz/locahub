import 'package:get/get.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';
import 'package:locahub/core/views/authentification/view/login_page.dart';

class ProfileController extends GetxController {
  // Rx<User> user = Rx<User>(User.dummy);
  final count = 0.obs;

  logout() async {
    await UserPrefService().removeUserPref();
    Get.offAll(
      () => const LoginPage(),
    );
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
