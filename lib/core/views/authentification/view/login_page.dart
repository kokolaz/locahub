import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:locahub/core/models/user_model.dart';
import 'package:locahub/core/services/network_services/auth_service.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';
import 'package:locahub/core/views/authentification/controller/login_controller.dart';
import 'signup_page.dart';
import '../../global/theme.dart';
import '../../homepage/view/widget/bottom_navbar/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = Get.put(LoginController());
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isVisible = false.obs;

  bool _isLoading = false;
  Future<void> loginWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    await LoginController().loginWithGoogle();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      home: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          //normalnya 56
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Login",
            style: darkTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        body: Form(
          key: _formState,
          child: ListView(children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: <Widget>[
                  //Logo
                  Container(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: Image.asset('assets/images/logo/locahub.png',
                        height: 71, width: 53),
                  ),

                  //Form login
                  Container(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Email',
                          style: darkTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 9),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == "") {
                              return "Email wajib diisi";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            fillColor: lightgreyColor,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: lightgreyColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: lightgreyColor),
                            ),
                            hintText: 'user@gmail.com or 08xxxxxxxxxx',
                            hintStyle: mutedTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Password',
                          style: darkTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 9),
                        Obx(() {
                          return TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value == "") {
                                return "Password wajib diisi";
                              }
                              return null;
                            },
                            obscureText: !isVisible.value,
                            decoration: InputDecoration(
                              fillColor: lightgreyColor,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: lightgreyColor),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  isVisible.value = !isVisible.value;
                                  isVisible.refresh();
                                },
                                icon: Icon(
                                  isVisible.value == true
                                      ? FontAwesomeIcons.solidEyeSlash
                                      : FontAwesomeIcons.solidEye,
                                  size: 16,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: lightgreyColor),
                              ),
                              hintText: '********',
                              hintStyle: mutedTextStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),

                  //Button login
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: SizedBox(
                      width: double.infinity,
                      height: 43,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: orangeColor),
                        child: Text(
                          'Login',
                          style: poppinsTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        onPressed: () async {
                          if (_formState.currentState!.validate()) {
                            await AuthService()
                                .login(
                              emailController.text,
                              passwordController.text,
                            )
                                .then((value) async {
                              if (value.statusCode == 200) {
                                log("200", name: "LoginPage->login");
                                var jsonData = jsonDecode(value.body);
                                var user =
                                    User.fromJson(jsonData["data"]["user"]);
                                UserPrefService().writeToken(
                                    jsonData["data"]["access_token"]);
                                await UserPrefService.setUser(user);
                                Get.offAll(
                                  () => const Home(),
                                );
                              } else {
                                log("err", name: "LoginPage->login");
                                Get.showSnackbar(
                                  GetSnackBar(
                                    title: "Something went wrong",
                                    message: value.body,
                                  ),
                                );
                              }
                            });
                          }
                        },
                      ),
                    ),
                  ),

                  //Google
                  GetBuilder<LoginController>(builder: (controller) {
                    return Container(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: _isLoading
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 43,
                                    width: 43,
                                    child: CircularProgressIndicator(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Text('Processing',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 18,
                                        )),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              width: double.infinity,
                              height: 43,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: greyColor),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/logo/google.png',
                                        width: 18,
                                        height: 18,
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        'Google',
                                        style: darkTextStyle.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    controller.loginWithGoogle();
                                  }),
                            ),
                    );
                  }),

                  //Daftar akun
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        style: poppinsTextStyle.copyWith(
                            fontSize: 12), //apply style to all
                        children: [
                          TextSpan(
                              text: 'Belum punya akun? Daftar akun ',
                              style: darkTextStyle.copyWith(
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: 'disini!',
                              style: orangeTextStyle.copyWith(
                                fontWeight: FontWeight.w700,
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
