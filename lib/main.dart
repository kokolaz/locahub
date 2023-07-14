import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/data/global.dart';
import 'package:locahub/core/views/authentification/view/login_page.dart';
import 'package:locahub/core/views/authentification/view/signup_page.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'core/views/welcome_page/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Initialize the FlutterLocalNotificationsPlugin
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Configure the initialization settings for Android and iOS
  const InitializationSettings initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings(
        '@mipmap/launcher_icon'), // Replace with your own app icon name
    // iOS: IOSInitializationSettings(),
  );
  // Initialize the plugin with the initialization settings
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Main Page',
          theme: ThemeData(primarySwatch: mcOrange),
          scaffoldMessengerKey: snackbarKey,
          routes: {
            '/': (context) => const SplashScreen(),
            '/sign-up': (context) => const SignUpPage(),
            '/sign-in': (context) => const LoginPage(),
            //'/search-result': (context) => SearchResultPage(),
          },
        );
      },
    );
  }
}
