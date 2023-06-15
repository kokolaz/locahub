// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:locahub/core/data/config.dart';
// import 'dart:convert';

// import 'package:locahub/core/models/user_model.dart';
// import 'package:locahub/core/services/pref_services/user_pref_service.dart';

// class UserController extends GetxController {
//   final UserPrefService userPrefService = UserPrefService();

//   var users = <User>[].obs;
//   Future<void> fetchUsers() async {
//     String token = userPrefService.readToken();
//     var url = Uri.parse(UserConfig.main);
//     log(url.toString());
//     var response = await http.get(
//       url,
//       headers: ApiConfig.tokenHeader(token),
//     );

//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = json.decode(response.body);

//       users.value = data["data"]["data"]
//           .map<User>((e) => User.fromJson(e))
//           .toList();
//       print(users.value);

//       } else {
//       throw Exception('Failed to load products');
//     }
//   }


// }


