import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/views/authentification/controller/signup_controller.dart';
import 'login_page.dart';
import '../../global/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SigunpController sigunpController = Get.put(SigunpController());

  // ignore: unused_field
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign Up Page',
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
            "Registrasi Akun",
            style: darkTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: darkgreyColor,
              size: 14,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              //Digunakan agar widget mengisi ruang kosong pada layar
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Logo
                Image.asset('assets/images/logo/locahub.png',
                    height: 71, width: 53),
                const SizedBox(height: 35),

                //Form register
                GetBuilder<SigunpController>(
                  builder: (controller) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Name',
                          style: darkTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 9),
                        TextFormField(
                          controller: controller.nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Nama wajib diisi";
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
                            hintText: 'johndoe Balikoping',
                            hintStyle: mutedTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Username',
                          style: darkTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 9),
                        TextFormField(
                          controller: controller.usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Username wajib diisi";
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
                            hintText: 'johndoe',
                            hintStyle: mutedTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Email',
                          style: darkTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 9),
                        TextFormField(
                          controller: controller.emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
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
                            hintText: 'johndoe@gmail.com',
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
                        TextFormField(
                          controller: controller.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password wajib diisi";
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
                            hintText: '********',
                            hintStyle: mutedTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Telepon',
                          style: darkTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 9),
                        TextFormField(
                          controller: controller.phoneNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Telepon wajib diisi";
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
                            hintText: '08xxxxxxxxxx',
                            hintStyle: mutedTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          width: double.infinity,
                          height: 43,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.checkSignup();
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: orangeColor),
                            child: Text(
                              'Registrasi Akun',
                              style: poppinsTextStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                //harusnya 20
                const SizedBox(height: 25),

                //login
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text.rich(
                    TextSpan(
                      style: poppinsTextStyle.copyWith(
                          fontSize: 12), //apply style to all
                      children: [
                        TextSpan(
                            text: 'Sudah punya akun? Login ',
                            style: poppinsTextStyle.copyWith(
                                fontWeight: FontWeight.w400, color: darkColor)),
                        TextSpan(
                            text: 'disini!',
                            style: poppinsTextStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: orangeColor))
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
    );
  }
}
