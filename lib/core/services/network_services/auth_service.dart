import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:locahub/core/data/config.dart';

class AuthService {
  // LOGIN AKUN USER
  Future<http.Response> login(
    String email,
    String password,
  ) async {
    log(email, name: "$this->login:email");
    log(password, name: "$this->login:password");
    Uri url = Uri.parse(
      AuthConfig.login,
    );
    log(url.toString(), name: "$this->login:endpoint");

    return await http.post(url,
        headers: ApiConfig.header,
        body: jsonEncode({
          "email": email,
          "password": password,
        }));
  }

  Future<http.Response> editProfile(
    String token,
    String name,
    String email,
    String bio,
    String ttl,
    String username,
    String phoneNumber,
  ) async {
    Uri url = Uri.parse(
      ProfileConfig.updateUser,
    );
    var body = jsonEncode({
      'name': name,
      'email': email,
      'bio': bio,
      'ttl': ttl,
      'username': username,
      'phone_number': phoneNumber,
    });
    return await http.post(url,
        headers: ApiConfig.tokenHeader(token), body: body);
  }

  //GANTI PASSWORD
  Future<http.Response> changePassword({
    required int id,
    required String token,
    required String currentPassword,
    required String password,
    required String confirmPassword,
  }) async {
    Uri url = Uri.parse(
      AuthConfig.changePassword,
    );
    var body = jsonEncode({
      'id': id,
      'current_password': currentPassword,
      'password': password,
      'confirm_password': confirmPassword,
    });
    return await http.post(url,
        headers: ApiConfig.tokenHeader(token), body: body);
  }
}




// class AuthService {
//   // LOGIN AKUN USER
//   Future<http.Response> login(
//     String email,
//     String password,
//   ) async {
//     log(email, name: "$this->login:email");
//     log(password, name: "$this->login:password");
//     Uri url = Uri.parse(
//       AuthConfig.login,
//     );
//     log(url.toString(), name: "$this->login:endpoint");

//     return await http.post(url,
//         headers: ApiConfig.header,
//         body: jsonEncode({
//           "email": email,
//           "password": password,
//         }));
//   }

  
//   //UPDATE PROFILE
//   Future<http.Response> editProfile(
//     String token,
//     String name,
//     String email,
//     String bio,
//     String ttl,
//     String username,
//     String phone_number,
//   ) async {
//     Uri url = Uri.parse(
//       ProfileConfig.updateUser,
//     );
//     var body = jsonEncode({
//       'name': name,
//       'email': email,
//       'bio': bio,
//       'ttl': ttl,
//       'username': username,
//       'phone_number': phone_number,
//     });
//     return await http.post(url,
//         headers: ApiConfig.tokenHeader(token), body: body);
//   }

//   //GANTI PASSWORD
//   Future<http.Response> changePassword({
//     required int id,
//     required String token,
//     required String currentPassword,
//     required String password,
//     required String confirmPassword,
//   }) async {
//     Uri url = Uri.parse(
//       AuthConfig.changePassword,
//     );
//     var body = jsonEncode({
//       'id': id,
//       'current_password': currentPassword,
//       'password': password,
//       'confirm_password': confirmPassword,
//     });
//     return await http.post(url,
//         headers: ApiConfig.tokenHeader(token), body: body);
//   }
// }
