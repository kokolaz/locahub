import 'package:get/get.dart';

import 'package:locahub/core/models/user_model.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';

class MainController extends GetxController {
  // final _apiServices = ApiService();
  final _users = User().obs;
  Rx<User> get users => _users;
  Future<int> getUserId() async {
    User user = await getUsers();
    return user.id!;
  }

  Future<User> getUsers() async {
    _users.value = await UserPrefService.getUser() ?? User();
    print(_users.value.toJson());
    return _users.value;
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
