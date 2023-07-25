// ignore_for_file: non_constant_identifier_names

import 'package:locahub/core/services/pref_services/user_pref_service.dart';

class ApiConfig {
  static String base_url = "http://locahub.my.id";
  // static String base_url = "https://167e-180-241-242-132.ap.ngrok.io";
  static String api = "$base_url/api";
  static Map<String, String> header = {
    "accept": "application/json",
    "content-type": "application/json",
  };

  static Map<String, String> tokenHeader(String token) {
    return {
      "accept": "application/json",
      "content-type": "application/json",
      "authorization": "Bearer $token",
    };
  }

  static Future<Map<String, String>> Headers() async {
    var token = UserPrefService().readToken();
    Map<String, String> data = {
      "accept": "application/json",
      "content-type": "application/json",
      "authorization": "Bearer $token",
    };
    return data;
  }
}

class HomeConfig {
  static String banner = "${ApiConfig.api}/banner/14"; //get Banner
}

class AuthConfig {
  static String register = "${ApiConfig.api}/register";
  static String login = "${ApiConfig.api}/login";
  static String changePassword = "${ApiConfig.api}/changePassword";
}

class ProfileConfig {
  static String updateUser = "${ApiConfig.api}/user";
}

class ProductCategory {}

class ProductRating {}

class Voucher {}

class CartConfig {
  static String main = "${ApiConfig.api}/cart";
}

class AddressConfig {
  static String main = "${ApiConfig.api}/address";
  static String all = "${ApiConfig.api}/address/all";
  static String add = "${ApiConfig.api}/address/add";
  static String update = "${ApiConfig.api}/address/edit";
}

class RajaOngkirConfig {
  static String main = "${ApiConfig.api}/raja-ongkir/check";
}

class TransactionConfig {
  static String main = "${ApiConfig.api}/transaction";
}

class ProductConfig {
  static String main = "${ApiConfig.api}/products";
}

class UserConfig {
  static String main = "${ApiConfig.api}/user";
}

class FavoriteConfig {
  static String main = "${ApiConfig.api}/products-favorites";
}
