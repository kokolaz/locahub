import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user_model.dart';

class UserPrefService {
  final GetStorage userPref = GetStorage("user");

  initUserPref() async {
    await userPref.initStorage;
  }

  removeUserPref() {
    userPref.erase();
  }

  writeToken(String value) {
    userPref.write("token", value);
  }

  readToken() {
    return userPref.read("token");
  }

  writeUser(value) {
    userPref.write("user", value);
  }

  readUser() {
    return userPref.read("user");
  }

  //Set User data
  static Future<void> setUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', json.encode(user.toJson()));
  }

  //Get User data
  static Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString('user');
    if (user == null) return null;
    return User.fromJson(json.decode(user));
  }

  //Clear user data
  static Future<void> clearUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }

  static Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
