// import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:locahub/core/data/my_color.dart';
// import 'package:locahub/core/data/global.dart';
// import 'package:locahub/core/providers/auth_provider.dart';
// import 'package:locahub/core/views/authentification/view/login_page.dart';
// import 'package:locahub/core/views/authentification/view/signup_page.dart';

// import 'core/views/welcome_page/splash_screen.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => AuthProvider(),
//         ),
//       ],
//       child: GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Main Page',
//         theme: ThemeData(primarySwatch: mcOrange),
//         scaffoldMessengerKey: snackbarKey,
//         routes: {
//           '/': (context) => const SplashScreen(),
//           '/sign-up': (context) => const SignUpPage(),
//           '/sign-in': (context) => const LoginPage(),
//           //'/search-result': (context) => SearchResultPage(),
//         },

//         // home: SplashScreen(),
//       ),
//     );
//   }
// }

//2
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locahub/core/data/global.dart';
import 'package:locahub/core/views/authentification/view/login_page.dart';
import 'package:locahub/core/views/authentification/view/signup_page.dart';
import 'package:locahub/core/views/global/theme.dart';
import 'core/views/welcome_page/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
