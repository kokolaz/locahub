import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/services/pref_services/user_pref_service.dart';
import 'package:locahub/core/views/homepage/view/widget/bottom_navbar/home.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'welcome_page.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    UserPrefService().initUserPref()!.then((_) {
      var token = UserPrefService().readToken();
      if (token != null) {
        Get.offAll(
          () => const Home(),
        );
      } else {
        startSplashScreen();
      }
    });
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(
      duration,
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) {
              return const WelcomePage();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      home: Scaffold(
        backgroundColor: whiteColor,
        body: Center(
          child: Image.asset(
            'assets/images/logo/locahub.png',
            height: 109,
            width: 81,
          ),
        ),
      ),
    );
  }
}
